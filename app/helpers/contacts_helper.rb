module ContactsHelper

  def field_name(fields, field_id)
    fields.each do |field|
      return field.name if field_id == field.id
    end
  end

  def combobox_options(db_options, field_id, selected_option = nil)
    options = []
    db_options.each do |option|
      options << [option.name, option.id]if option.field_id == field_id
    end
    options_for_select options, selected: selected_option.to_s
  end

end
