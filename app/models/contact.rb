class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :text_field_values, dependent: :delete_all
  accepts_nested_attributes_for :text_field_values
  has_many :text_area_field_values, dependent: :delete_all
  accepts_nested_attributes_for :text_area_field_values
  has_many :combo_box_field_values, dependent: :delete_all
  accepts_nested_attributes_for :combo_box_field_values
end
