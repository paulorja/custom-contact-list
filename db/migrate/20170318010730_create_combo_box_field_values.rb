class CreateComboBoxFieldValues < ActiveRecord::Migration
  def change
    create_table :combo_box_field_values do |t|
      t.references :contact, index: true, foreign_key: true
      t.references :field, index: true, foreign_key: true
      t.integer :selected_option_id

      t.timestamps null: false
    end
  end
end
