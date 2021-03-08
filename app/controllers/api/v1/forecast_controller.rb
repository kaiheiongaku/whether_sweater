class Api::V1::ForecastController < ApplicationController
  def index
    render json: ForecastSerializer.new(ForecastFacade.retrieve_forecast_info(params[:location]))
  end
end
