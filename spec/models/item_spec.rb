require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it "name,description,price,category_id,status_id,shipping_charges_id,shipping_area_id,shipping_day_idが存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it "imageがないと出品ができない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空では出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空では出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      
      it "category_idが1(未選択)では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが1(未選択)では出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      
      it "shipping_charges_idが1(未選択)では出品できない" do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end

      it "shipping_area_idが1(未選択)では出品できない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      
      it "shipping_day_idが1(未選択)では出品できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      
      it "priceが空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it "priceが300未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it "priceが10,000,000以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "priceが全角数字では出品できない" do
        @item.price = "６００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英数字では出品できない" do
        @item.price = "123abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英語では出品できない" do
        @item.price = "abcdef"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end