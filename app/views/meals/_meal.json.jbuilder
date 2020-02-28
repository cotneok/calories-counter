json.extract! meal, :id, :name, :date, :calories, :created_at, :updated_at
json.url meal_url(meal, format: :json)
