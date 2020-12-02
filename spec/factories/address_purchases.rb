FactoryBot.define do
  factory :address_purchase do
    post_code       { '123-4567' }
    prefecture_id   { 2 }
    city            { '大阪市北区' }
    house_number    { '大阪1-2-3' }
    building_name   { '大阪ハイツ' }
    phone_number    { '12345678901' }
    token           { 'tok_abcdefghijk00000000000000000' }
    end
  end

