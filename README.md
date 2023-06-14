#テーブル設計

##　users テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| nickname              | string | null: false|
| email                 | string | null: false , unique: true|
| password              | string | null: false |
| password-confirmation | string | null: false |
| last-name             | string | null:false  |
| first-name            | string | null: false |
| last-name-kana        | string | null: false |
| first-name-kana       | string | null: false |
| birth-date            | integer| null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| item-image         | string    | null: false |
| item-name          | string    | null: false |
| item-info          | text      | null: false |
| item-category      | integer   | null: false |
| item-sales-status  | integer   | null: false |
| user               | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

##　orders テーブル

| Column                   | Type   | Options     |
| ------------------       | ------ | ----------- |
| item-shipping-fee-status | integer| null: false |
| item-prefecture          | integer| null: false |
| item-scheduled-delivery  | integer| null: false |
| item-price               | string | null: false |
| add-tax-price            | string | null: false |
| profit                   | string | null: false |
| user                     | reference | null: false, foreign_key: true |
| items                    | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippings テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| postal-code        | string    | null: false |
| prefecture         | integer   | null: false |
| city               | string    | null: false |
| addresses          | string    | null: false |
| building           | string    | null: false |
| phone-number       | string    | null: false |

### Association

- has_one :order 