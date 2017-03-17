class CreateTextAreaFieldValues < ActiveRecord::Migration
  def change
    create_table :text_area_field_values do |t|
      t.references :field, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.text :value

      t.timestamps null: false
    end
  end
end
