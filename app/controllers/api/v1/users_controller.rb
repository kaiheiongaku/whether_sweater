class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
  end

  private
  def user_params
    binding.pry
    params.require(:data).permit(:email, :password, :password_confirmation)
  end
end
