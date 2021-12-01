require 'rails_helper'
RSpec.describe Pet, type: :model do
  before do
    @pet = FactoryBot.build(:pet)
  end

  describe '新規投稿' do
    context '投稿できる場合' do
      it '全ての項目を正しく入力すれば登録できる' do
        expect(@pet).to be_valid
      end
    end
    context '登録できない場合' do
      it 'titleが空では登録できない' do
        @pet.title = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Title can't be blank")
      end
    end
  end
end
