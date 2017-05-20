class Message < ApplicationRecord
  belongs_to :contact
  belongs_to :phone_number
end
