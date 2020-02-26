json.extract! meal, :id, :name, :date, :time, :calories, :created_at, :updated_at
json.url meal_url(meal, format: :json)
