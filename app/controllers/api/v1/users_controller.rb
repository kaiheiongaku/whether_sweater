class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: UsersSerializer.new(@user, status: 201)
    else
      render json: { error: 'I hate to be a confuser, but we could\'t create that user.'}, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
