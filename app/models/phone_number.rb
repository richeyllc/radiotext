class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :number, uniqueness: true
end
