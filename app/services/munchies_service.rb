class MunchiesService
  class << self
    def travel_breakdown(start, destination, food)
      travel_time = MapFacade.retrieve_travel_time(start, destination)
      restaurant = FoodFacade.pull_restaurant(destination, food)
      forecast_info = ForecastFacade.retrieve_forecast_info(destination)
      forecast = Hash.new
      forecast[:temperature] = forecast_info.current_weather.temperature
      forecast[:summary] = forecast_info.current_weather.conditions

      breakdown = Hash.new
      breakdown[:travel_time] = travel_time
      breakdown[:forecast] = forecast
      breakdown[:restaurant] = restaurant

      breakdown
    end
  end
end
