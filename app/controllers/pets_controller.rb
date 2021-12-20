class PetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

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
    @user = @pet.user_id
  end

  def edit
    redirect_to root_path if @pet.user_id != current_user.id
  end

  def update
    if @pet.update(pet_params)
      redirect_to pet_path
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to root_path
  end

  def search
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  private

  def pet_params
    params.require(:pet).permit(:title, :animal_name, :animal_category_id, :breed, :sex_id, :age_id, :weight_id, :status, :prefecture_id, :vaccination_id, :castration_id,
                                :area, :reason, :charge, :condition, :image).merge(user_id: current_user.id)
  end

  def set_pet
    @pet = Pet.find(params[:id])
  end
end
