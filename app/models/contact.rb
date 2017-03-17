class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :text_field_values
  accepts_nested_attributes_for :text_field_values
end
