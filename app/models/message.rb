class Message < ApplicationRecord
  belongs_to :contact
  belongs_to :phone_number
  belongs_to :conversation

  validates :body, presence: true
  validates :to, presence: true
  validates :from, presence: true

end
