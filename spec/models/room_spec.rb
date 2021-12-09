require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム作成' do
    context '作成できる場合' do
      it 'room_nameの値が存在すれば作成できる' do
        expect(@room).to be_valid
      end
    end
    context '作成できない場合' do
      it 'room_nameが空では作成できない' do
        @room.room_name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Room name can't be blank")
      end
      it 'room_nameが40文字以上だと保存できない' do
        @room.room_name = 'a' * 41
        @room.valid?
        expect(@room.errors.full_messages).to include('Room name is too long (maximum is 40 characters)')
      end
    end
  end
end
