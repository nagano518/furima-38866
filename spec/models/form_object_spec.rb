require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    @form = FactoryBot.build(:form_object)
  end

  describe '商品購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@form).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @form.building_name = ''
        expect(@form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'area_idが1だと保存できないこと' do
        @form.area_id = '1'
        @form.valid?
        expect(@form.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @form.municipality = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @form.address = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @form.telephone_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んでないと保存できないこと' do
        @form.postal_code = '0000000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeが全角が含まれていると保存できないこと' do
        @form.postal_code = '０００-００００'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'telephone_numberが10桁未満だと保存できないこと' do
        @form.telephone_number = '0000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁以上だと保存できないこと' do
        @form.telephone_number = '00000000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが全角だと保存できないこと' do
        @form.telephone_number = '００００００００００'
        @form.valid?
        expect(@form.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
