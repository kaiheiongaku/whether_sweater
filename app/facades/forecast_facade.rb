class ForecastFacade
  class << self
    def retrieve_forecast_info(location)
      raw_data = ForecastService.obtain_forecast_data(location)
      Forecast.new(raw_data)
    end
  end
end
