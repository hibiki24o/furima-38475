# usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| password           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| date               | string | null: false               |
 
# productsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| product_user       | string     | null: false                    |
| explanation        | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| sender             | string     | null: false                    |
| prefecture         | references | null: false, foreign_key: true |


# shoppingsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product            | string     | null: false                    |
| title              | string     | null: false                    |
| price              | integer    | null: false                    |
| prefecture         | references | null: false, foreign_key: true |


# shipping_addressテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | integer    | null: false                    |
| building_name      | string     | null: false                    |
| tell               | integer    | null: false                    |

