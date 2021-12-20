class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @user_detail = UserDetail.find(params[:id])
    @pets = @user.pets
    @room = @user.rooms
  end

  def edit
    @user = User.find(params[:id])
    @user_detail = UserDetail.find(params[:id])
  end

  def update
    user_detail = UserDetail.find(params[:id])
    if user_detail.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

private

def user_params
  params.require(:user_detail).permit(:birthday, :household_id, :experience, :have_animal, :pet_friendly_id, :desired_animal,
    :economic_status, :deposit, :have_surgery_id, :get_vaccine_id, :indoor_outdoor, :visit_id, :consent_id, :remarks).merge(user_id: current_user.id)
end

end
