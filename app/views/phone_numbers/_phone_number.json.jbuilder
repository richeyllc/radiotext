json.extract! phone_number, :id, :number, :description, :created_at, :updated_at
json.url phone_number_url(phone_number, format: :json)
