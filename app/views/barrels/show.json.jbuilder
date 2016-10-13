json.barrel do
  json.partial! "barrels/barrel", barrel: @barrel
end

json.barrel_statuses do
  json.array! @barrel.barrel_statuses.last(10)
end

json.owner do
  json.owner_data @owner
  json.type @owner.class.name
end
