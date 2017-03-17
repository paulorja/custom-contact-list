class Field < ActiveRecord::Base
  belongs_to :user

  enum field_type: [:text, :text_area]

end
