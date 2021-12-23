class AdoptionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @pet = Pet.find(params[:pet_id])
    if current_user.id == @pet.user_id
      redirect_to root_path
    elsif (current_user.id != @pet.user_id) && @pet.adoption.present?
      redirect_to root_path
    end
    @adoption = Adoption.new
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
    params.require(:adoption).merge(user_id: current_user.id, pet_id: params[:pet_id])
  end
end
