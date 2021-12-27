class AdoptionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @pet = Pet.find(params[:pet_id])
    @user = User.find(params[:user_id])
    @adoption = Adoption.new
    if current_user.id != @pet.user_id
      redirect_to root_path
    elsif (current_user.id == @pet.user_id) && @pet.adoption.present?
      redirect_to root_path
    end
  end

  def create
    @pet = Pet.find(params[:pet_id])
    @adoption = Adoption.new(adoption_params)
    binding.pry
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
end
