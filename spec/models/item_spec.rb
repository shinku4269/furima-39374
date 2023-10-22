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
      it "imagesがないと出品ができない" do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end

      it "nameが空では出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it "descriptionが空では出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      
      it "category_idが1(未選択)では出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it "status_idが1(未選択)では出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      
      it "shipping_charges_idが1(未選択)では出品できない" do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end

      it "shipping_area_idが1(未選択)では出品できない" do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      
      it "shipping_day_idが1(未選択)では出品できない" do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      
      it "priceが空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it "priceが300未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は299より大きい値にしてください")
      end

      it "priceが10,000,000以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は10000000より小さい値にしてください")
      end

      it "priceが全角数字では出品できない" do
        @item.price = "６００"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      
      it "priceが半角英数字では出品できない" do
        @item.price = "123abc"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end
      
      it "priceが半角英語では出品できない" do
        @item.price = "abcdef"
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は数値で入力してください")
      end

      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end

    end
  end
end