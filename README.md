# usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| encrypted_password | string | null: false                    |
| email              | string | null: false, unique: true      |
| fast_name          | string | null: false, foreign_key: true |
| middle_name        | string | null: false, foreign_key: true |
| fast_kana_name     | string | null: false, foreign_key: true |
| middle_kana_name   | string | null: false, foreign_key: true |
| birthday           | date   | null: false                    |
 
# productsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| title                 | string     | null: false                    |
| product_user          | string     | null: false, foreign_key: true |
| explanation           | text       | null: false                    |
| category_id           | integer    | null: false                    | 
| status_id             | integer    | null: false                    |
| delivery_charge_id    | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| days_id               | integer    | null: false                    |
| price                 | integer    | null: false                    |

# shoppingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | references | null: false, foreign_key: true |


# shipping_addressテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false, foreign_key: true |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| build_name         | string     | null: false                    |
| tell               | string     | null: false                    |

