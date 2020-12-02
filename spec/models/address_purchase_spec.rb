require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  describe '購入情報の保存' do
    before do
      @address_purchase = FactoryBot.build(:address_purchase)
    end

    it 'post_code（郵便番号）が空だと保存できないこと' do
      @address_purchase.post_code = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Post code can't be blank")
    end

    it 'prefecture_id(都道府県)の選択がない場合は登録できないこと' do
      @address_purchase.prefecture_id = '1'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Prefecture Select")
    end

    it 'city（市区町村）が空だと保存できないこと' do
      @address_purchase.city = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("City can't be blank")
    end

    it 'house_number（番地）が空だと保存できないこと' do
      @address_purchase.house_number = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_number（電話番号）が空だと保存できないこと' do
      @address_purchase.phone_number = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'post_code（郵便番号）が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @address_purchase.post_code = '1234567'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it 'phone_number（電話番号）が11桁以内でないと保存できないこと' do
      @address_purchase.phone_number = '123456789012'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_number（電話番号）にはハイフンが不要であること' do
      @address_purchase.phone_number = '123-4567-8901'
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "tokenが空では登録できないこと" do
      @address_purchase.token = nil
      @address_purchase.valid?
      expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
