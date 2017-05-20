class SurveyQuestion < ApplicationRecord
  belongs_to :survey
  belongs_to :survey_question_type
end
