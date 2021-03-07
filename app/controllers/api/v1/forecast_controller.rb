class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastFacade.retrieve_forecast_info(params[:location])
    #params[:location] (do a permit)
    #Have to go to maps first to get lat and lon
    #then take return values and hit weather api
    #Forecasts Facade that calls a forecasts service for the mapquest and then the facade calls the service for the weather. Facade passes the return to controller with the only job of the controller to turn it into json through the serializer. Do weather poro?
  end
end
