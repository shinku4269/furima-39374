require 'rails_helper'

RSpec.describe PurchaseDestination do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @purchase_destination = FactoryBot.build(:purchase_destination, item_id: item.id, user_id: user.id) 
    sleep 0.1
  end

  describe '商品購入' do
    
    context '商品が購入できる場合' do
      
      it 'すべての情報が存在すれば購入できる' do
        expect(@purchase_destination).to be_valid
      end

      it 'building_nameがなくても購入できる' do
        @purchase_destination.building_name = nil
        expect(@purchase_destination).to be_valid
      end
    end

    context '商品が購入できない場合' do

      it 'post_codeが空では購入できない' do
        @purchase_destination.post_code = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'post_codeが3桁ハイフン4桁の半角文字列ではないと購入できない' do
        @purchase_destination.post_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it "shipping_area_idの値が空（id = 1）では購入できない" do
        @purchase_destination.shipping_area_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'cityが空では購入できない' do
        @purchase_destination.city = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空では購入できない' do
        @purchase_destination.address = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numberが空では購入できない' do
        @purchase_destination.phone_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      
      it 'phone_numberが9桁以下の場合は購入できない' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は10文字以上で入力してください")
      end

      it 'phone_numberが12桁以上の場合は購入できない' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end

      it 'phone_numberが半角数字のみでない場合は購入できない' do
        @purchase_destination.phone_number = '123-456-789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'item_idが空では購入できない' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("商品を入力してください")
      end

      it 'user_idが空では購入できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("ユーザーを入力してください")
      end

      it 'tokenが空では購入できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end  
end
