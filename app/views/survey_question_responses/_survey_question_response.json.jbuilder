json.extract! survey_question_response, :id, :contact_id, :survey_id, :survey_question_id, :boolean_response, :rate_response, :written_response, :created_at, :updated_at
json.url survey_question_response_url(survey_question_response, format: :json)
