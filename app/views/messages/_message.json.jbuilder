json.extract! message, :id, :contact_id, :phone_number_id, :twilio_date_created, :twilio_date_updated, :date_sent, :account_sid, :to, :from, :body, :status, :flag, :api_version, :price, :uri, :twilio_data, :created_at, :updated_at
json.url message_url(message, format: :json)
