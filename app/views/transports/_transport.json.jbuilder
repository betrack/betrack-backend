json.extract! transport, :id, :number, :current_lat, :current_lon, :temperature, :temperature_date, :identification, :phone_number, :driver, :created_at, :updated_at
json.url transport_url(transport, format: :json)