class AddFieldTypeToField < ActiveRecord::Migration
  def change
    add_column :fields, :field_type, :integer
  end
end
