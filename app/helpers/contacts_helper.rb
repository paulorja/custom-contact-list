module ContactsHelper

  def field_name(fields, field_id)
    fields.each do |field|
      return field.name if field_id == field.id
    end
  end

end
