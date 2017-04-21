json.extract! renter, :id, :renter_name, :renter_email, :renter_password, :created_at, :updated_at
json.url renter_url(renter, format: :json)
