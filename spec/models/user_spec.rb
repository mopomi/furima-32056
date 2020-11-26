require 'rails_helper'

describe User do
 describe '#create' do

   it "nameがない場合は登録できないこと" do
     user = build(:user, name: nil)
     user.valid?
     expect(user.errors.full_messages).to include "Name can't be blank"
   end

   it "emailがない場合は登録できないこと" do
     user = build(:user, email: nil)
     user.valid?
     expect(user.errors.full_messages).to include "Email can't be blank"
   end

   it "passwordがない場合は登録できないこと" do
     user = build(:user, password: nil)
     user.valid?
    expect(user.errors.full_messages).to include "Password can't be blank"
  end

  it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
  end

  it " passwordが6文字以上であれば登録できること " do
    user = build(:user, password: "11111a", password_confirmation: "11111a")
    expect(user).to be_valid
  end

  it " passwordが5文字以下であれば登録できないこと " do
    user = build(:user, password: "1111a", password_confirmation: "1111a")
    user.valid?
    expect(user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
  end

  it "emailに@とドメインが存在する場合は登録できること " do
    user = build(:user, email: "kkk@gmail.com")
    user.valid?
    expect(user).to be_valid
  end

  it " 重複したemailが存在する場合は登録できないこと " do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include "Email has already been taken"
  end

   it "last_nameがない場合は登録できないこと" do
     user = build(:user, last_name: nil)
     user.valid?
     expect(user.errors.full_messages).to include "Last name can't be blank"
   end

   it "first_nameがない場合は登録できないこと" do
     user = build(:user, first_name: nil)
     user.valid?
     expect(user.errors.full_messages).to include "First name can't be blank"
   end

   it "last_name_kanaがない場合は登録できないこと" do
     user = build(:user, last_name_kana: nil)
     user.valid?
     expect(user.errors.full_messages).to include "Last name kana can't be blank"
   end

   it "first_name_kanaがない場合は登録できないこと" do
     user = build(:user, first_name_kana: nil)
     user.valid?
     expect(user.errors.full_messages).to include "First name kana can't be blank"
   end

   it "birthdayがない場合は登録できないこと" do
     user = build(:user, birthday: nil)
     user.valid?
     expect(user.errors.full_messages).to include "Birthday can't be blank"
   end

   it "nameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できること" do
     user = build(:user)
     expect(user).to be_valid
    end
  end
end
