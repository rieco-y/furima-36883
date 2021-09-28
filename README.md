# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association

- has_many :items
- has_many :shopping_lists
- has_many :comments

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| text               | string     | null: false                    |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| genre              | string     | null: false                    |
| condition          | string     | null: false                    |
| delivery_cost      | string     | null: false                    |
| send_schedule      | string     | null: false                    |

### Association

- has_one :shopping_list
- belongs_to :user
- has_many :comments


## shopping_lists テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user_id             | references | null: false, foreign_key: true |
| item_id             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shopping_address

## shopping_address テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| address           | string     | null: false                    |
| shopping_lists_id | references | null: false, foreign_key: true |

### Association

- has_many :shopping_lists

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
