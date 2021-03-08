class ForecastService
  class << self
    def obtain_forecast_data(location)
      latlon = MapFacade.retrieve_latlon(location)
      WeatherFacade.pull_weather_data(latlon)
    end
  end
end
