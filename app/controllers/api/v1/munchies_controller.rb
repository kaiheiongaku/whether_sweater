class Api::V1::MunchiesController < ApplicationController
  def index
    render json: MunchySerializer.new(MunchiesFacade.destination_info(params[:start], params[:destination], params[:food]))
  end
end
