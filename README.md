# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| full_name          | string  | null: false               |
| full_name_kana     | string  | null: false               |
| prefecture_id      | integer | null: false               |
| phone_number       | string  | null: false               |
| birthday           | date    |                           |
| household_id       | integer |                           |
| experience         | string  |                           |
| have_animal        | string  |                           |
| pet_friendly_id    | integer |                           |
| desired_animal     | text    |                           |
| economic_status    | string  |                           |
| deposit            | string  |                           |
| have_surgery_id    | integer |                           |
| get_vaccine_id     | integer |                           |
| indoor_outdoor     | string  |                           |
| visit_id           | integer |                           |
| consent_id         | integer |                           |
| remarks            | text    |                           |

### Association

- has_many :pets
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :adoptions
- has_many :messages


## pets テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| animal_name        | string     | null: false                    |
| animal_category_id | integer    | null: false                    |
| breed              | string     | null: false                    |
| sex_id             | integer    | null: false                    |
| age_id             | integer    | null: false                    |
| weight_id          | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| vaccination_id     | integer    | null: false                    |
| castration_id      | integer    | null: false                    |
| area               | text       | null: false                    |
| charge             | integer    | null: false                    |
| condition          | text       | null: false                    |
| reason             | text       | null: false                    |
| status             | text       | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :adoption
- belongs_to :user
- has_many :rooms


## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
- belongs_to :pet


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## messages テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | string     |                                |
| user               | references | null: false, foreign_key: true |
| pet                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


## adoptions テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| pet                | references | null: false, foreign_key: true |

### Association

- belongs_to :pet
- belongs_to :user
