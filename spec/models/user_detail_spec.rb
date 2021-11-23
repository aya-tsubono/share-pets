require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  before do
    @user_detail = FactoryBot.build(:user_detail)
  end

  describe 'ユーザー新規登録' do
    context '登録できる場合' do
      it '全ての項目を入力すれば登録できる' do
        expect(@user_detail).to be_valid
      end
      it 'household_idを選択しなくても登録できる' do
        @user_detail.household_id = 1
        expect(@user_detail).to be_valid
      end
      it 'experienceが空でも登録できる' do
        @user_detail.experience = ''
        expect(@user_detail).to be_valid
      end
      it 'have_animalが空でも登録できる' do
        @user_detail.have_animal = ''
        expect(@user_detail).to be_valid
      end
      it 'pet_friendly_idが選択しなくても登録できる' do
        @user_detail.pet_friendly_id = 1
        expect(@user_detail).to be_valid
      end
      it 'desired_animalが空でも登録できる' do
        @user_detail.desired_animal = ''
        expect(@user_detail).to be_valid
      end
      it 'economic_statusが空でも登録できる' do
        @user_detail.economic_status = ''
        expect(@user_detail).to be_valid
      end
      it 'depositが空でも登録できる' do
        @user_detail.deposit = ''
        expect(@user_detail).to be_valid
      end
      it 'have_surgery_idが選択しなくても登録できる' do
        @user_detail.have_surgery_id = 1
        expect(@user_detail).to be_valid
      end
      it 'get_vaccine_idが選択しなくても登録できる' do
        @user_detail.get_vaccine_id = 1
        expect(@user_detail).to be_valid
      end
      it 'indoor_outdoorが空でも登録できる' do
        @user_detail.indoor_outdoor = ''
        expect(@user_detail).to be_valid
      end
      it 'visit_idが選択しなくても登録できる' do
        @user_detail.visit_id = 1
        expect(@user_detail).to be_valid
      end
      it 'consent_idが選択しなくても登録できる' do
        @user_detail.consent_id = 1
        expect(@user_detail).to be_valid
      end
      it 'remarksが空でも登録できる' do
        @user_detail.remarks = ''
        expect(@user_detail).to be_valid
      end
    end
    context '登録できない場合' do
      it 'birthdayが空では登録できない' do
        @user_detail.birthday = ''
        @user_detail.valid?
        expect(@user_detail.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
