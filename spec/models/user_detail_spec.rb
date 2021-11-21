require 'rails_helper'

RSpec.describe UserDetail, type: :model do
  before do
    @user_detail = FactoryBot.build(:user_detail)
  end

  describe "ユーザー新規登録" do
    context '登録できる場合' do
      it '全ての項目を入力すれば登録できる' do
        expect(@user_detail).to be_valid
      end
      it "household_idが空でも登録できる" do
      end
      it "experienceが空でも登録できる" do
      end
      it "have_animalが空でも登録できる" do
      end
      it "pet_friendly_idが空でも登録できる" do
      end
      it "desired_animalが空でも登録できる" do
      end
      it "economic_statusが空でも登録できる" do
      end
      it "depositが空でも登録できる" do
      end
      it "have_surgery_idが空でも登録できる" do
      end
      it "get_vaccine_idが空でも登録できる" do
      end
      it "indoor_outdoorが空でも登録できる" do
      end
      it "visit_idが空でも登録できる" do
      end
      it "consent_idが空でも登録できる" do
      end
      it "remarksが空でも登録できる" do
      end
    end
    context '登録できない場合' do
      it "birthdayが空では登録できない" do
      end

    end
  end
end
