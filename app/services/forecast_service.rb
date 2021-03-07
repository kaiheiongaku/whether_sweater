class ForecastService
  class << self
    def obtain_forecast_info(location)
      latlon = MapFacade.get_latlon
    end
  end

end
