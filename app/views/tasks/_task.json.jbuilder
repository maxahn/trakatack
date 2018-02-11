json.extract! task, :id, :description, :active, :score, :created_at, :updated_at
json.url task_url(task, format: :json)
