# アプリケーション名	
share-pets

## アプリケーション概要	
このアプリケーションでできることを記述。

## URL	
https://share-pets.herokuapp.com/

## テスト用アカウント
ログイン機能等を実装した場合は、ログインに必要な情報を記述。
### Basic認証
ユーザー名: admin
Password: 2222

## 利用方法	
このアプリケーションの利用方法を記述。

## 目指した課題解決	
このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。

## 洗い出した要件	
スプレッドシートにまとめた要件定義を記述。

## 実装した機能についての画像やGIFおよびその説明	
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

## 実装予定の機能	
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

## データベース設計	
ER図等を添付。

## ローカルでの動作方法	
git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。


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
