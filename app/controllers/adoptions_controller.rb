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

  end
end
