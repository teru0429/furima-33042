# テーブル設計

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| Nickname           | string  | null: false  |
| Last name          | string  | null: false  |
| First name         | string  | null: false  |
| Last name kana     | string  | null: false  |
| First name kana    | string  | null: false  |
| Birth              | date    | null: false  |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| item_name              | string     | null: false       |
| info                   | text       | null: false       |
| price                  | integer    | null: false       |
| Category_id            | integer    | null: false       |
| sales status_id        | integer    | null: false       |
| shipping fee status_id | integer    | null: false       |
| Prefecture_id          | integer    | null: false       |
| Scheduled delivery_id  | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buy テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| user                | references | foreign_key: true |
| item                | references | foreign_key: true |
| Prefecture_id       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| address             | string     | null: false       |
| Postal code         | string     | null: false       |
| City                | string     | null: false       |
| building number     | string     |                   |
| Prefecture_id       | integer    | null: false       |
| phone number        | string     | null: false       |

### Association

- belongs_to :buy