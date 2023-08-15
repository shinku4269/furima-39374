require 'rails_helper'

RSpec.describe PurchaseDestination do
  
  before do
    @purchase_destination = FactoryBot.build(:purchase_destination)
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
        expect(@purchase_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが3桁ハイフン4桁の半角文字列ではないと購入できない' do
        @purchase_destination.post_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code is invalid")
      end

      it "shipping_area_idの値が空（id = 1）では購入できない" do
        @purchase_destination.shipping_area_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it 'cityが空では保存できないこと' do
        @purchase_destination.city = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @purchase_destination.address = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @purchase_destination.phone_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it 'phone_numberが9桁以下の場合は保存できないこと' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
      end

      it 'phone_numberが12桁以上の場合は保存できないこと' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'phone_numberが半角数字でない場合は保存できないこと' do
        @purchase_destination.phone_number = '123-456-789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number is invalid")
      end

      it 'item_idが空では保存できないこと' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では保存できないこと' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end  
end
