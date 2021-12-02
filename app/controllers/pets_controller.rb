class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @pets = Pet.all.order('created_at DESC')
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:title, :animal_name, :animal_category_id, :breed, :sex_id, :age_id, :weight_id, :status, :prefecture_id, :vaccination_id, :castration_id,
                                :area, :reason, :charge, :condition, :image).merge(user_id: current_user.id)
  end
end
