class ContactsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_contact, :authorize_user, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @contact = Contact.new
    @fields = current_user.fields
    @options = ComboBoxOption.where(field_id: @fields.pluck(:id))

    @fields.each do |field|
      @contact.text_field_values.new(field_id: field.id) if field.text?
      @contact.text_area_field_values.new(field_id: field.id) if field.text_area?
      @contact.combo_box_field_values.new(field_id: field.id) if field.combo_box?
    end
  end

  def edit
    @fields = current_user.fields
    @options = ComboBoxOption.where(field_id: @fields.pluck(:id))

    @fields.each do |field|
      if field.text? and !@contact.text_field_values.map(&:field_id).include? field.id
        @contact.text_field_values.new(field_id: field.id)
      end
      if field.text_area? and !@contact.text_area_field_values.map(&:field_id).include? field.id
        @contact.text_area_field_values.new(field_id: field.id)
      end
      if field.combo_box? and !@contact.combo_box_field_values.map(&:field_id).include? field.id
        @contact.combo_box_field_values.new(field_id: field.id)
      end
    end
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    @fields = current_user.fields
    @options = ComboBoxOption.where(field_id: @fields.pluck(:id))

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
    end
  end

  private

    def set_contact
      @contact = Contact.find(params[:id])
    end

    def authorize_user
      if @contact.user_id != current_user.id
        redirect_to contacts_path, alert: 'Access denied.'
      end
    end

    def contact_params
      params.require(:contact).permit(:name, :email,
                                      text_field_values_attributes: [:id, :value, :contact_id, :field_id],
                                      text_area_field_values_attributes: [:id, :value, :contact_id, :field_id],
                                      combo_box_field_values_attributes: [:id, :selected_option_id, :contact_id, :field_id],
      )
    end

end
