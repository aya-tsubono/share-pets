require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '登録できる場合' do
      it '必要な項目全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録できない場合' do
     it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "full_nameが空では登録できない" do
      @user.full_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Full name can't be blank")
     end
     it "full_name_kanaが空では登録できない" do
      @user.full_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Full name kana can't be blank")
     end
     it "phoe_numberが空では登録できない" do
      @user.phone_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number can't be blank")
     end
     it "prefecture_idが空では登録できない" do
      @user.prefecture_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture can't be blank")
     end
     it "passwordが5文字以下では登録できない" do
      @user.password = 'abab1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it "passwordは英字混合でないと登録できない" do
      @user.password = 'ababab'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end
     it "passwordは全角文字では登録できない" do
      @user.password = 'テストパスワード'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end
     it "passwordは数字のみでは登録できない" do
      @user.password = '123456'
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end
     it 'passwordとconfirmationが一致していないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "emailに＠が含まれていないと登録できない" do
      @user.email = 'mail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it 'emailは重複して登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'last_name_kanaがカタカナ以外だと登録できない' do
      @user.full_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Full name kana is invalid')
     end
     it 'phone_numberは、10桁以上11桁以内の半角数値でないと保存できない' do
      @user.phone_number = '0908877'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
     end
     it 'phone_numberは、9桁以下の半角数値では保存できない' do
      @user.phone_number = '090887766'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
     end
     it 'phone_numberは、12桁以上の半角数値では保存できない' do
      @user.phone_number = '090887766554433'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
     end
     it 'phone_numberは、ハイフンが含まれていると保存できない' do
      @user.phone_number = '090-8888-9999'
      @user.valid?
      expect(@user.errors.full_messages).to include('Phone number is invalid')
     end
    end
  end
end