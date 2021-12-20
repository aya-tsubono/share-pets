class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @user_detail = UserDetail.find(params[:id])
    @pets = @user.pets
    @room = @user.rooms
  end

  def edit

  end

  def update

  end
end
