# テーブル設計

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false  |
| nickname           | string  | null: false  |
| last_name          | string  | null: false  |
| first_name         | string  | null: false  |
| last_name_kana     | string  | null: false  |
| first_name_kana    | string  | null: false  |
| birth              | date    | null: false  |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| info                   | text       | null: false       |
| price                  | integer    | null: false       |
| category_id            | integer    | null: false       |
| sales_status_id        | integer    | null: false       |
| shipping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | references | foreign_key: true |
| item                | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| address             | string     | null: false       |
| postal_code         | string     | null: false       |
| city                | string     | null: false       |
| building_number     | string     |                   |
| prefecture_id       | integer    | null: false       |
| phone_number        | string     | null: false       |
| buy                 | references | foreign_key: true |

### Association

- belongs_to :buy