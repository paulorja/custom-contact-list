class CreateComboBoxOptions < ActiveRecord::Migration
  def change
    create_table :combo_box_options do |t|
      t.string :name
      t.references :field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
