json.extract! user, :id, :name, :email_address, :password_digest, :icon, :created_at, :updated_at
json.url user_url(user, format: :json)
