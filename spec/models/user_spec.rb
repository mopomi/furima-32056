require 'rails_helper'
describe User do
  before do
      @user = FactoryBot.build(:user)
  end

   it "nameがない場合は登録できないこと" do
     @user.name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Name can't be blank"
   end

   it "emailがない場合は登録できないこと" do
     @user.email = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Email can't be blank"
   end

   it "passwordがない場合は登録できないこと" do
     @user.password = ""
     @user.valid?
    expect(@user.errors.full_messages).to include "Password can't be blank"
  end

   it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
     @user.password_confirmation = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
   end

   it " passwordが6文字以上であれば登録できること " do
     @user.password = "11111a"
     @user.password_confirmation = "11111a"
     @user.valid?
     expect(@user).to be_valid
   end

   it " passwordが5文字以下であれば登録できないこと " do
     @user.password = "1111a"
     @user.password_confirmation = "1111a"
     @user.valid?
     expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
   end

   it " passwordが英字のみの場合登録できないこと " do
    @user.password = "aaaaaa"
    @user.password_confirmation = "aaaaaa"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
   end

   it " passwordが数字のみの場合登録できないこと " do
    @user.password = "111111"
    @user.password_confirmation = "111111"
    @user.valid?
    expect(@user.errors.full_messages).to include "Password is invalid"
   end

   it "emailに@とドメインが存在する場合は登録できること " do
     @user.email = "ttt@gmail.com"
     @user.valid?
     expect(@user).to be_valid
   end

   it " 重複したemailが存在する場合は登録できないこと " do
     @user.save
     another_user = FactoryBot.build(:user)
     another_user.email = @user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include "Email has already been taken"
   end

   it "last_nameがない場合は登録できないこと" do
     @user.last_name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Last name can't be blank"
   end

   it "first_nameがない場合は登録できないこと" do
     @user.first_name = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "First name can't be blank"
   end

   it "last_name_kanaがない場合は登録できないこと" do
     @user.last_name_kana = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Last name kana can't be blank"
   end

   it "first_name_kanaがない場合は登録できないこと" do
     @user.first_name_kana = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "First name kana can't be blank"
   end

   it "last_nameに全角漢字、ひらがな、カタカナ以外が入力されている場合に登録できないこと" do
    @user.last_name = "yamada"
    @user.valid?
    expect(@user.errors.full_messages).to include "Last name Full-width characters"
   end

   it "first_nameに全角漢字、ひらがな、カタカナ以外が入力されている場合に登録できないこと" do
    @user.first_name = "hanako"
    @user.valid?
    expect(@user.errors.full_messages).to include "First name Full-width characters"
   end

   it "last_name_kanaに全角カタカナ以外が入力されている場合に登録できないこと" do
    @user.last_name_kana = "山田"
    @user.valid?
    expect(@user.errors.full_messages).to include "Last name kana Full-width katakana characters"
   end

   it "first_name_kanaに全角カタカナ以外が入力されている場合に登録できないこと" do
    @user.first_name_kana = "花子"
    @user.valid?
    expect(@user.errors.full_messages).to include "First name kana Full-width katakana characters"
   end

   it "birthdayがない場合は登録できないこと" do
     @user.birthday = ""
     @user.valid?
     expect(@user.errors.full_messages).to include "Birthday can't be blank"
   end

   it "nameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できること" do
     @user = FactoryBot.build(:user)
     expect(@user).to be_valid
   end
end
