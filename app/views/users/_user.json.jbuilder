json.extract! user, :id, :first_name, :email, :daily_hours, :created_at, :updated_at
json.url user_url(user, format: :json)
