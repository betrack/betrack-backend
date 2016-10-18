json.barrel do
  json.partial! "barrels/barrel", barrel: @barrel
  json.last_state @barrel.last_state
  json.last_temperature @barrel.last_temperature
end

json.barrel_statuses do
  json.array! @barrel.last_24_temperatures do |status|
    json.temperature status.temperature
    json.sent_at status.temperature_tstmp
  end
end

json.owner do
  json.owner_data @owner
  json.type @owner.class.name
end
