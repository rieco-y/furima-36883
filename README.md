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
| birth_date         | date    | null: false               |

### Association

- has_many :items
- has_many :shopping_lists
- has_many :comments

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_text          | text       | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| category_id        | string     | null: false                    |
| condition_id       | string     | null: false                    |
| delivery_cost_id   | string     | null: false                    |
| send_area_id       | string     | null: false                    |
| send_schedule_id   | string     | null: false                    |

### Association

- has_one :shopping_list
- belongs_to :user
- has_many :comments


## shopping_lists テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address_list

## address_lists テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_num          | string     | null: false                    |
| todouhuken_id     | string     | null: false                    |
| city              | string     | null: false                    |
| house_num         | integer    | null: false                    |
| building_name     | string     | null: false                    |
| tel_num           | integer    | null: false                    |
| shopping_lists    | references | null: false, foreign_key: true |

### Association

- has_many :shopping_lists

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
