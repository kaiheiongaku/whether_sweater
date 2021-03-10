class RoadTripFacade
  class << self
    def generate_roadtrip(origin, destination)
      roadtrip_info = RoadTripService.road_trip_info(origin, destination)
      RoadTrip.new(origin, destination, roadtrip_info)
    end
  end
end
