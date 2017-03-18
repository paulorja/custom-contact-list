class Field < ActiveRecord::Base
  belongs_to :user
  has_many :text_field_values, dependent: :delete_all
  has_many :text_area_field_values, dependent: :delete_all
  has_many :combo_box_options, dependent: :delete_all

  enum field_type: [:text, :text_area, :combo_box]

  validates :name, presence: true

end
