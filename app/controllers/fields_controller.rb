class FieldsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_field, :authorize_user, only: [:show, :edit, :update, :destroy]

  def index
    @fields = Field.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @field = Field.new
  end

  def edit
  end

  def create
    @field = Field.new(field_params)
    @field.set_user(current_user)


    respond_to do |format|
      if @field.save
        format.html { redirect_to @field, notice: 'Field was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to @field, notice: 'Field was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to fields_url, notice: 'Field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_field
      @field = Field.find(params[:id])
    end

    def authorize_user
      if @field.user_id != current_user.id
        redirect_to contacts_path, alert: 'Access denied.'
      end
    end

    def field_params
      params.require(:field).permit(:user_id, :name)
    end

end
