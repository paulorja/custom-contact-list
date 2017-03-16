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
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.set_user(current_user)

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
      params.require(:contact).permit(:name, :email)
    end

end
