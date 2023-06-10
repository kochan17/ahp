# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_one :profile

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|age|integer|null: false|
|gender|string|null: false|
|interests|string|null: false|

### Association
- belongs_to :user
- has_one :recommendation

## recommendationsテーブル

|Column|Type|Options|
|------|----|-------|
|profile_id|integer|null: false, foreign_key: true|
|text|string|null: false|

### Association
- belongs_to :profile
