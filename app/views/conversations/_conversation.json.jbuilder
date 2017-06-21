json.extract! conversation, :id, :to_number_id, :from_number_id, :seen_at, :deleted_at, :notes, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
