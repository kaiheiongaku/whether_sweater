class ForecastFacade
  class << self
    def retrieve_forecast_info(location)
      ForecastService.obtain_forecast_info(location)
    end
  end

end
