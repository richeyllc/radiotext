class Listener < ApplicationRecord
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
end
