# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| Nickname        | string  | null: false |
| Last name       | string  | null: false |
| First name      | string  | null: false |
| Last name kana  | string  | null: false |
| First name kana | string  | null: false |
| Birth year      | integer | null: false |
| Birth month     | integer | null: false |
| Birth day       | integer | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               | string     | null: false |
| item_name           | string     | null: false |
| info                | text       | null: false |
| price               | string     | null: false |
| Category            | string     | null: false |
| sales status        | string     | null: false |
| shipping fee status | string     | null: false |
| Prefecture          | string     | null: false |
| Scheduled delivery  | string     | null: false |
| user                | references |             |

### Association

- belongs_to :user
- has_many :buys

## buy テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| credit              | string     | null: false       |
| users_id            | string     | foreign_key: true |
| items_id            | string     | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## address テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| address             | string     | null: false |
| phone number        | string     | null: false |

### Association

- has_one :user