class Blast < ApplicationRecord
  belongs_to :blast_type
  belongs_to :schedule
end
