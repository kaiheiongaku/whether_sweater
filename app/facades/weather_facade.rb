class WeatherFacade
  class << self
    def pull_weather_data(lat_and_lon)
    endpoint = 'data/2.5/onecall?'
    params = { lat: lat_and_lon[:lat],
               lon: lat_and_lon[:lng] }
    WeatherService.call_weather_db(endpoint, params)
    end
  end
end
