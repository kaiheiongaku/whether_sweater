class MunchySerializer
  include FastJsonapi::ObjectSerializer
  attributes :destination_city, :restaurant, :forecast, :travel_time
  attribute type: 'munchy'
  set_id { 'null' }
end
