json.extract! survey_question, :id, :survey_id, :survey_question_type_id, :question, :created_at, :updated_at
json.url survey_question_url(survey_question, format: :json)
