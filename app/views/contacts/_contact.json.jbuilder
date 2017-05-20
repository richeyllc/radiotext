json.extract! contact, :id, :name, :email, :address_1, :address_2, :city, :state, :phone, :age, :birthdate, :opt_in_a, :opt_in_b, :opt_in_c, :confirmed_number, :notes, :created_at, :updated_at
json.url contact_url(contact, format: :json)
