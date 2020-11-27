FactoryBot.define do
  factory :item do
    title               {"商品名"}
    introduction        {"説明文"}
    category_id         {2}
    item_condition_id   {2}
    shipping_payer_id   {2}
    prefecture_id       {2}
    days_to_ship_id      {2}
    price               {10000}
  end
end