class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_room, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @room.messages.includes(:user)
    @pet = @room.pet
    @user = @room.room_users[0].user_id
  end

  def create
    @message = @room.messages.new(message_params)
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end
