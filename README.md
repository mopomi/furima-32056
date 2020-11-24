# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | siring | null: false |
| birthday           | date   | null: false |


### Association

- has_many :items, dependent: :destroy
- has_many :purchase_histories, dependent: :destroy


## items テーブル

| Column              | Type       | Options                       |
| ------------------- | ---------- | ----------------------------- |
| title               | string     | null: false                   |
| introduction        | text       | null: false                   |
| category_id         | integer    | null: false, foreign_key:true |
| item_condition_id   | integer    | null: false, foreign_key:true |
| shipping_payer_id   | integer    | null: false, foreign_key:true |
| prefecture_id       | integer    | null: false, foreign_key:true |
| days_to_ship_id     | integer    | null: false, foreign_key:true |
| user                | references | null: false, foreign_key:true |

### Association

- belongs_to :user
- has_one :purchase_history
- has_one_attached :image


## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false, foreign_key:true  |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key:true  |

### Association

- belongs_to :purchase_history


## purchase_histories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address
