class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :shipping_payer
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :introduction
    validates :price
    validates :category_id, numericality: { other_than: 1 }
    validates :item_condition_id, numericality: { other_than: 1 } 
    validates :shipping_payer_id, numericality: { other_than: 1 } 
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :days_to_ship_id, numericality: { other_than: 1 } 
  end
end
