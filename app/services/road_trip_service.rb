class RoadTripService
  class << self
    def road_trip_info(origin, destination)
      breakdown = travel_breakdown(origin, destination)
      weather = hourly_weather_at_eta(breakdown[:latlon_at_end])

      trip_info = {travel_time: breakdown[:travel_time], hourly_weather_at_eta: weather}
    end

    def travel_breakdown(origin, destination)
      MapFacade.travel_breakdown(origin, destination)
    end

    def hourly_weather_at_eta(latlon)
      WeatherFacade.pull_weather_data(latlon)[:hourly]
    end
  end
end