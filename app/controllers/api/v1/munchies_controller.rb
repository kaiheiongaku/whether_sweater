class Api::V1::MunchiesController < ApplicationController
  def index
    render json: MunchiesSerializer.new(MunchiesFacade.destination_info(params[:start], params[:destination], params[:food]))
  end
end
