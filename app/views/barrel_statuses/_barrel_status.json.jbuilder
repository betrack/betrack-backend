json.extract! barrel_status, :id, :temperature, :temperature_tstmp, :state, :created_at, :updated_at
json.url barrel_status_url(barrel_status, format: :json)