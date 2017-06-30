class Conversation < ApplicationRecord
  belongs_to :my_number #, class_name: 'PhoneNumber'
  belongs_to :from_number, class_name: 'PhoneNumber'
  has_many :messages
end
