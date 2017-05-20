json.extract! survey, :id, :name, :description, :schedule_id, :status, :created_at, :updated_at
json.url survey_url(survey, format: :json)
