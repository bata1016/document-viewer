# README

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
| name    | string     | null: false                    |
| folder  | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association
- belongs_to :folder
- belongs_to :user

## folderテーブル

| Column | Type       | Options                  |
| ------ | ---------- | -------------------------|
| name   | string     | null: false              |
| user   | references | null: false, foreign_key |


### Association
- belongs_to :user
- has_many   :documents



Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


