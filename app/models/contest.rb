class Contest < ApplicationRecord
  belongs_to :contest_type
  belongs_to :schedule
  belongs_to :survey
end
