class Survey < ApplicationRecord
  belongs_to :schedule
  has_many :survey_questions
end
