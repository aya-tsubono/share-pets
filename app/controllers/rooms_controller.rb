class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @room = Room.new
    @pet = Pet.find(params[:pet_id])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    redirect_to root_path if @room.user_ids != current_user.id
    @room.destroy
  end

  private

  def room_params
    params.require(:room).permit(:pet_id, :room_name, user_ids: [])
  end
end
