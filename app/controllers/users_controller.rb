class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit]
  before_action :set_detail, only: [:show, :edit, :update]

  def show
    @pets = @user.pets
    @room = @user.rooms
  end

  def edit
    redirect_to root_path if @user.id != current_user.id
  end

  def update
    if @user_detail.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user_detail).permit(:prefecture_id, :household_id, :experience, :have_animal, :pet_friendly_id, :desired_animal,
                                        :economic_status, :deposit, :have_surgery_id, :get_vaccine_id, :indoor_outdoor, :visit_id, :consent_id, :remarks).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_detail
    @user_detail = UserDetail.find(params[:id])
  end
end
