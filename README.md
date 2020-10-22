# アプリケーション名
DocumentViewer

# 概要
PDFを保存し、いつでも見返すことのできるアプリケーション

# 本番環境
https://documents-viewer.herokuapp.com/ <br>
ゲストユーザーによるログイン機能実装済

# 制作背景
前職で社内の資料を探すのが手間だったため、何度も見返すものを簡単に取り出せるアプリケーションを作りたいと思い作成しました。<br>
DEMO: /Users/kawabatahiroaki/projects/document-viewer/app/assets/images/動作確認.gif

# 工夫点
視覚的に機能がわかるようシンプルさを意識しました。<br>
保存機能だけでなく、出力機能を持たせることでPDFの操作をアプリケーション内で完結させるようにしました。

# 開発環境
## フロントエンド
HTML, CSS, Scss, JavaScript 

## バックエンド
Ruby Ruby on Rails

## データベース
MySQL

## インフラ
Heroku

## サーバー
Heroku

## ストレージ
AWS S3

## エディタ
VSCode

# 課題や今後実装したい機能
URLを指定することで、ローカルを経由せずとも直接アプリケーション内に保存することができる機能を実装したいと考えています。


# DB設計

## userテーブル

| Column    | Type   | Options     |
| --------- | ------ | ------------|
| name      | string | null: false |
| email     | string | null: false |
| password  | string | null: false |


### Association
- has_many :documents
- has_many :folders

## documentテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| tag     | string     | null: false                    |
| folder  | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association
- belongs_to :folder
- belongs_to :user

## folderテーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ------------------------------|
| folder_name   | string     | null: false, uniqueness: true |
| user          | references | null: false, foreign_key      |


### Association
- belongs_to :user
- has_many   :documents





