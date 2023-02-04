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
| birth_date         | date   | null: false                    |

### Association

* has_many :products
* has_many :settlemnts

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
| scheduled_day_id      | integer    | null: false                    |
| price                 | integer    | null: false                    |

### Association

* belongs_to :user
* has_one :settlemnt

# settlemntsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |

### Association

* has_one :shipping_addresse
* belongs_to :product
* belongs_to :user


# shipping_addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| build_name         | string     |                                |
| tell               | string     | null: false                    |
| settlemnt          | references | null: false, foreign_key: true |

### Association

* belongs_to :settlemnt