module FieldsHelper

  def edit_screen
    true if action_name == 'edit'
  end

  def create_screen
    true if action_name == 'new'
  end

end
