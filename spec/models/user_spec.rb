require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user_detail = FactoryBot.build(:user_detail)
  end

  describe "ユーザー新規登録" do
    context '登録できる場合' do
      it '必要な項目全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録できない場合' do
     it "nicknameが空では登録できない" do
     end
     it "passwordが空では登録できない" do
     end
     it "emailが空では登録できない" do
     end
     it "full_nameが空では登録できない" do
     end
     it "full_name_kanaが空では登録できない" do
     end
     it "phoe_numberが空では登録できない" do
     end
     it "prefecture_idが空では登録できない" do
     end
     it "passwordが5文字以下では登録できない" do
     end
     it "passwordは英字混合でないと登録できない" do
     end
     it "passwordは全角文字では登録できない" do
     end
     it "passwordは数字のみでは登録できない" do
     end
     it 'passwordとconfirmationが一致していないと登録できない' do
     end
     it "emailに＠が含まれていないと登録できない" do
     end
     it 'emailは重複して登録できない' do
     end
     it 'full_nameが漢字・ひらがな・カタカナ以外だと登録できない' do
     end
     it 'last_name_kanaがカタカナ以外だと登録できない' do
     end
     it 'phone_numberは、10桁以上11桁以内の半角数値でないと保存できない' do
     end
     it 'phone_numberは、9桁以下の半角数値では保存できない' do
     end
     it 'phone_numberは、12桁以上の半角数値では保存できない' do
     end
   end
 end