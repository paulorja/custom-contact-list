class CreateTextFieldValues < ActiveRecord::Migration
  def change
    create_table :text_field_values do |t|
      t.references :field, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
