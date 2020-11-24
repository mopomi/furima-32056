# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | siring | null: false |
| birth_year      | string | null: false |
| birth_month     | string | null: false |
| birth_day       | string | null: false |


### Association

- has_many :items, dependent: :destroy
- has_many :purchase_histories, dependent: :destroy
- has_one :shipping_address, dependent: :destroy


## items テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| title          | string     | null: false                   |
| introduction   | text       | null: false                   |
| category       | integer    | null: false, foreign_key:true |
| item_condition | integer    | null: false, foreign_key:true |
| shipping_payer | integer    | null: false, foreign_key:true |
| shipping_from  | integer    | null: false, foreign_key:true |
| days_to_ship   | integer    | null: false, foreign_key:true |
| seller_id      | references | null: false, foreign_key:true |
| buyer_id       | references | foreign_key:true              |

### Association

- belongs_to :user
- has_one :purchase_history
- has_one_attached :image


## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | integer    | null: false, foreign_key:true  |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key:true  |

### Association

- belongs_to :user


## purchase_histories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| buyer_id | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## item_images テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_id   | references | null: false, foreign_key: true |
| image_url | string     | null: false,                   |

### Association

- belongs_to :item
