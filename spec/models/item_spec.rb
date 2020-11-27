require 'rails_helper'
describe User do
  before do
      @item = FactoryBot.build(:item)
  end

    it "画像がない場合は登録できないこと" do
      @item.image= nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end

    it "名前がない場合は登録できないこと" do
      @item.title= ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end

    it "introduction(説明文)がない場合は登録できないこと" do
      @item.introduction= ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Introduction can't be blank"
    end

    it "category_id(カテゴリーの選択)がない場合は登録できないこと" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Category Select"
    end

    it "item_condition_id(商品の状態)の選択がない場合は登録できないこと" do
      @item.item_condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Item condition Select"
    end

    it "shipping_payer_id(発送料の負担)の選択がない場合は登録できないこと" do
      @item.shipping_payer_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping payer Select"
    end

    it "prefecture_id(発送元の地域)の選択がない場合は登録できないこと" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture Select"
    end

    it "days_to_ship_id(発送までの日数)の選択がない場合は登録できないこと" do
      @item.days_to_ship_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship Select"
    end

    it "price(価格)の入力がない場合は登録できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    
    it "price(価格)が10,000,000円以上の場合は登録できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
    
    it "price(価格)が299円以下の場合は登録できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
  end