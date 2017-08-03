class Competition < ApplicationRecord
  has_many :competitors
  
  def self.not_expired
      where('end_date >= ?', Date.current)
  end
end
