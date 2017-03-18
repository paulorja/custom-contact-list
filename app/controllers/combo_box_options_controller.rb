class ComboBoxOptionsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_option, :set_field, :authorize_user, only: [:edit, :update, :destroy]


  def new
    @option = ComboBoxOption.new
  end

  def create
    set_field
    @option = @field.combo_box_options.new(option_params)

    respond_to do |format|
      if @option.save
        format.html { redirect_to @field, notice: 'Option was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @option.update(option_params)
        format.html { redirect_to @field, notice: 'Option was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to @field, notice: 'Option was successfully destroyed.' }
    end
  end


  private

    def set_field
      @field = Field.find_by_id(params[:id])
    end

    def set_option
      @option = ComboBoxOption.find(params[:option_id])
    end

    def authorize_user
      # TODO
    end

    def option_params
      params.require(:combo_box_option).permit(:name)
    end
end
