# アプリケーション名	
share-pets

## アプリケーション概要	
保護犬や保護猫などのペットを譲渡したい人とペットを飼いたい人をつなぐアプリケーション。

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
アプリケーションを介したペットの譲渡では、相手の顔が直接見えないため、無責任な飼い主や悪質なブリーダーではないか、安心できるユーザーかわからず、ユーザーが不安に感じることがあります。たとえば、動物愛護団体は、相手の素性がわからないと譲渡しません。そこで、保護した動物たちの幸せに貢献できるアプリケーションを目指し、ユーザー同士がコミュニケーションをとり、お互い信頼できるかどうかを確認できること、また、多くの動物愛護団体が譲渡時に確認している事項をユーザーのプロフィールとして登録することでスムーズに、かつ信頼できるアプリケーションを作成しました。安心して新しい家族を迎えられる、また、保護したペットが幸せになれるという両方のニーズを満たすことができるアプリケーションだと考えています。

## 洗い出した要件	
スプレッドシートにまとめた要件定義を記述。
https://docs.google.com/spreadsheets/d/1G91IsUimkhpJ_MR4WLKwkiZLYkBhscwAAX_-2x5yJbg/edit#gid=282075926

## 実装した機能についての画像やGIFおよびその説明	
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。
・ユーザー登録機能
ウィザード形式で入力し、基本情報とペット譲渡に関する項目を分けました。譲渡に関する項目は、動物の保護団体から譲渡する際に確認される項目を参考にし、詳細を記入できるようにしています。
・ユーザー詳細ページ
ユーザー同士のチャットルーム一覧や投稿一覧、情報の入力率をドーナツグラフで表示させています。
・ペット情報の投稿機能
画像は複数枚投稿でき、譲渡に必要な項目はなるべくプルダウン形式で入力できるようにしています。
・チャットルーム機能、メッセージ機能
ペット情報投稿者と里親希望者のコミュニケーションツールとしてメッセージ機能を実装しました。最終の意思確認や、譲渡に必要な引き渡し方法などの確認をするために作成しました。
・里親承認機能
ペット情報の投稿者にのみ、里親決定できる機能を実装しました。チャットでのコミュニケーションで信頼できると判断した場合にのみ承認できるようにしています。
・検索機能
ペット情報の詳細検索機能では、タイトル名、投稿者名、種類などの項目以外にも、引き取りに行ける範囲かどうかを確認するための所在地、費用面でも検索できるようにしました。

## 実装予定の機能	
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

## データベース設計	
![ER図](https://user-images.githubusercontent.com/88880199/148910799-dff7baf9-dd53-47de-a1ac-6e23241de24f.png)

## ローカルでの動作方法	
git clone https://git.heroku.com/share-pets.git

開発環境
Ruby/Ruby on Rails 6.0.0/MySQL/Github/Visual Studio Code

WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページから投稿ボタンをクリック→投稿情報を入力→投稿完了
確認後、ログアウト処理をお願いします。


# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| full_name          | string  | null: false               |
| full_name_kana     | string  | null: false               |
| phone_number       | string  | null: false               |
| birthday           | date    | null:false                |


### Association

- has_many :pets
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :adoptions
- has_many :messages
- has_one  :user_detail


## user_details テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| prefecture_id      | integer    | null: false                    |
| household_id       | integer    |                                |
| experience         | string     |                                |
| have_animal        | string     |                                |
| pet_friendly_id    | integer    |                                |
| desired_animal     | text       |                                |
| economic_status    | string     |                                |
| deposit            | string     |                                |
| have_surgery_id    | integer    |                                |
| get_vaccine_id     | integer    |                                |
| indoor_outdoor     | string     |                                |
| visit_id           | integer    |                                |
| consent_id         | integer    |                                |
| remarks            | text       |                                |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user


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

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| room_name   | string     | null: false                    |
| pet_id      | references | null: false, foreign key: true |

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
| room               | references | null: false, foreign_key: true |

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
