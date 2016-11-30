json.extract! body_mass_history, :id, :height, :weight, :body_mass, :created_at, :updated_at
json.url body_mass_history_url(body_mass_history, format: :json)