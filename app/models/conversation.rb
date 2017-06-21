class Conversation < ApplicationRecord
  belongs_to :to_number
  belongs_to :from_number
end
