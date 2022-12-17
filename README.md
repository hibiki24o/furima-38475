# usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| encrypted_password | string | null: false |
| mail               | string | null: false |
| birth              | string | null: false |
 
# productテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| explanation        | text       | null: false                    |
| product_details    | text       | null: false                    |
| category           | string     | null: false                    |

# shoppingテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | integer    | null: false                    |
| address            | string     | null: false                    |
| comment            | references | null: false, foreign_key: true |