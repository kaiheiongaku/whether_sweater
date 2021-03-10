class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:current_user_id] = user.id
      render json: UsersSerializer.new(user)
    else
      render json: { error: "Though you may insist, this email & password combo does not exist." }, status: 400
    end
  end
end
