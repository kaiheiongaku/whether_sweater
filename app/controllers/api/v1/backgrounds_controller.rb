class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: BackgroundSerializer.new(BackgroundsFacade.retrieve_background(params[:location]))
  end
end
