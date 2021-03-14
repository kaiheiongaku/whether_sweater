class Api::V1::RoadTripController < ApplicationController
  def create
    if User.find_by(api_key: params[:road_trip][:api_key]) && params[:road_trip][:origin] && params[:road_trip][:destination]
      render json: RoadtripSerializer.new(
        RoadTripFacade.generate_roadtrip(params[:road_trip][:origin], params[:road_trip][:destination])
      ), status: 201
    else
      render json: { error: 'Something went awry.'}, status: 401
    end
  end
end
