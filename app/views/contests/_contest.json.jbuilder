json.extract! contest, :id, :contest_type_id, :schedule_id, :name, :description, :texter_x, :texter_y, :keyword, :caller_x, :caller_y, :survey_id, :winner, :created_at, :updated_at
json.url contest_url(contest, format: :json)
