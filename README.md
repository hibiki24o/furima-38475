# usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| encrypted_password | string | null: false                    |
| email              | string | null: false, unique: true      |
| fast_name          | string | null: false                    |
| middle_name        | string | null: false                    |
| fast_kana_name     | string | null: false                    |
| middle_kana_name   | string | null: false                    |
| birthday           | date   | null: false                    |

### Association

* has_many :products
* has_many :shoppings

# productsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| title                 | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |
| explanation           | text       | null: false                    |
| category_id           | integer    | null: false                    | 
| status_id             | integer    | null: false                    |
| delivery_charge_id    | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| days_id               | integer    | null: false                    |
| price                 | integer    | null: false                    |

### Association

* belongs_to :users
* has_one :shipping_address

# shoppingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

### Association

* belongs_to :shipping_address


# shipping_addressテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code_id       | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| build_name         | string     |                                |
| tell               | string     | null: false                    |
| references         | references | null: false, foreign_key: true |

### Association

* belongs_to :products
* belongs_to :shoppings