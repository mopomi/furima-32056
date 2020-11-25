class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          validates :name, presence: true
          validates :last_name, presence: true,
                     format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, 
                     message: 'Full-width characters' } 

          validates :first_name, presence: true,
                     format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, 
                     message: 'Full-width characters' } 

          validates :last_name_kana, presence: true, 
                     format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, 
                     message:'Full-width katakana characters' }

          validates :first_name_kana, presence: true, 
                     format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/,
                     message:'Full-width katakana characters' }
          validates :birthday, presence: true

          VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d_-]+\z/i
          validates :password, presence: true,
                     format: { with: VALID_PASSWORD_REGEX }
end
