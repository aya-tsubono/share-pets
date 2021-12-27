require 'rails_helper'

RSpec.describe Adoption, type: :model do
  before do
    @adoption = FactoryBot.create(:adoption)
  end

  describe '里親決定' do
    context '作成できる場合' do
      it '全ての項目が正しく存在すれば作成できる' do
        expect(@adoption).to be_valid
      end
    end
    context '作成できない場合' do
      it 'pet_id空では作成できない' do
        @adoption.pet_id = nil
        @adoption.valid?
        expect(@adoption.errors.full_messages).to include("Pet can't be blank")
      end
      it 'user_id空では作成できない' do
        @adoption.user_id = nil
        @adoption.valid?
        expect(@adoption.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
