class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d_-]+\z/i.freeze

  with_options presence: true do
    validates :name
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
    validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'Full-width katakana characters' }
    validates :birthday
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end
end
