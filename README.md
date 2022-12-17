# usersテーブル

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false, foreign_key: true |
| encrypted_password | string | null: false                    |
| email              | string | null: false, unique: true      |
| fast_name          | string | null: false,                   |
| middle_name        | string | null: false,                   |
| fast_kana_name     | string | null: false,                   |
| middle_kana_name   | string | null: false,                   |
| birthday           | date   | null: false                    |
 
# productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| img                | text       | null: false                    |
| title              | string     | null: false                    |
| product_user       | string     | null: false, foreign_key: true |
| explanation        | text       | null: false                    |
| category           | text       | null: false                    | 
| Status             | text       | null: false                    |
| delivery_charge    | string     | null: false                    |
| prefecture         | references | null: false, foreign_key: true |
| days               | string     | null: false                    |
| price              | string     | null: false                    |

# shoppingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | string     | null: false                    |


# shipping_addressテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| tell               | string     | null: false                    |

