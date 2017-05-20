json.extract! blast, :id, :blast_type_id, :schedule_id, :name, :description, :status, :created_at, :updated_at
json.url blast_url(blast, format: :json)
