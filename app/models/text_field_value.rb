class TextFieldValue < ActiveRecord::Base
  belongs_to :contact
  belongs_to :field
end
