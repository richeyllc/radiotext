class SurveyQuestionResponse < ApplicationRecord
  belongs_to :contact
  belongs_to :survey
  belongs_to :survey_question
end
