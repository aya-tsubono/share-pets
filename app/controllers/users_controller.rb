class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

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
