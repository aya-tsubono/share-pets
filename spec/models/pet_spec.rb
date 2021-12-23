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
      it 'animal_nameが空では登録できない' do
        @pet.animal_name = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Animal name can't be blank")
      end
      it 'animal_category_idが空では登録できない' do
        @pet.animal_category_id = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Animal category can't be blank")
      end
      it 'breedが空では登録できない' do
        @pet.breed = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Breed can't be blank")
      end
      it 'sex_idが空では登録できない' do
        @pet.sex_id = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Sex can't be blank")
      end
      it 'age_idが空では登録できない' do
        @pet.age_id = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Age can't be blank")
      end
      it 'weight_idが空では登録できない' do
        @pet.weight_id = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Weight can't be blank")
      end
      it 'prefecture_idが空では登録できない' do
        @pet.prefecture_id = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'vaccination_idが空では登録できない' do
        @pet.vaccination_id = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Vaccination can't be blank")
      end
      it 'castration_idが空では登録できない' do
        @pet.castration_id = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Castration can't be blank")
      end
      it 'areaが空では登録できない' do
        @pet.area = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Area can't be blank")
      end
      it 'chargeが空では登録できない' do
        @pet.charge = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Charge can't be blank")
      end
      it 'conditionが空では登録できない' do
        @pet.condition = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Condition can't be blank")
      end
      it 'reasonが空では登録できない' do
        @pet.reason = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Reason can't be blank")
      end
      it 'statusが空では登録できない' do
        @pet.status = ''
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Status can't be blank")
      end
      it 'imageが空では登録できない' do
        @pet.images = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include("Images can't be blank", 'Images は1枚以上5枚以下にしてください')
      end
      it 'imageは5枚を超えて登録できない' do
        6.times do
          @pet.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
        end
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Images は1枚以上5枚以下にしてください')
      end
      it 'titleが50文字を超えると登録できない' do
        @pet.title = 'a' * 51
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Title is too long (maximum is 50 characters)')
      end
      it 'animal_nameが50文字を超えると登録できない' do
        @pet.animal_name = 'a' * 51
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Animal name is too long (maximum is 50 characters)')
      end
      it 'breedが50文字を超えると登録できない' do
        @pet.breed = 'a' * 51
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Breed is too long (maximum is 50 characters)')
      end
      it 'statusが1000文字を超えると登録できない' do
        @pet.status = 'a' * 1001
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Status is too long (maximum is 1000 characters)')
      end
      it 'areaが200文字を超えると登録できない' do
        @pet.area = 'a' * 201
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Area is too long (maximum is 200 characters)')
      end
      it 'reasonが500文字を超えると登録できない' do
        @pet.reason = 'a' * 501
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Reason is too long (maximum is 500 characters)')
      end
      it 'conditionが500文字を超えると登録できない' do
        @pet.condition = 'a' * 501
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Condition is too long (maximum is 500 characters)')
      end
      it 'chargeは、¥9,999,999を超えると保存できない' do
        @pet.charge = '10000000'
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Charge is not included in the list')
      end
      it 'chargeは半角数字でなければ登録できない' do
        @pet.charge = '３００'
        @pet.valid?
        expect(@pet.errors.full_messages).to include('Charge is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @pet.user = nil
        @pet.valid?
        expect(@pet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
