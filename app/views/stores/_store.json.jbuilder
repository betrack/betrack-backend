json.extract! store, :id, :lat, :lon, :name, :social_reason, :cuit, :email, :phone_number, :last_heartbeat, :created_at, :updated_at
json.url store_url(store, format: :json)