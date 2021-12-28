class AdoptionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_pet, only: [:new, :create]

  def new
    @user = User.find(params[:user_id])
    @adoption = Adoption.new
    if current_user.id != @pet.user_id
      redirect_to root_path
    elsif (current_user.id == @pet.user_id) && @pet.adoption.present?
      redirect_to root_path
    end
  end

  def create
    @adoption = Adoption.new(adoption_params)
    if @adoption.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def adoption_params
    params.require(:adoption).permit(:user_id).merge(pet_id: @pet.id)
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
