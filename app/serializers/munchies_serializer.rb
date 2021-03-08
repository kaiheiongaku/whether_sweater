class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :restaurant, :forecast, :travel_time
  attribute type: 'munchy'
  set_id { 'null' }
end
