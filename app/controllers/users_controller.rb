class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_detail = UserDetail.find(params[:id])
    @pets = @user.pets
  end
end
