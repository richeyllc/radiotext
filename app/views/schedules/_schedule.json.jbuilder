json.extract! schedule, :id, :schedule_type_id, :name, :description, :last_run, :next_run, :active, :status, :error_message, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
