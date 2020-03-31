# README

This README would normally document whatever steps are necessary to get the
application up and running.

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



## usersテーブル 
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|real-firat|string|null: false|
|real-last|string|null: false|
|hurigana-first| string| null: false|
|hurigana-last| string| null: false|
|birthday| string| null: false|
### Association
  has_many : comments
  has_many : items
  has_many : locations 


##  location
|Column|Type|Options|
|------|----|-------|
|to_first|string|null: false|
|to_last|string|null: false|
|hurigana_first|string|null: false|
|hurigana_last|string|null: false|
|postal|integer(7)|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|addres|string|null: false|
|discription|string|
|phone_number|integer|
|user_id|references|null: false, foreign_key: true|
### Association
  belongs_to : user


##  items
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|image|string|null: false|
|text|string|null: false|
|user_id|references|null: false, foreign_key: true|
|categoly_id|references|null: false, foreign_key: true|
|brand|string|null: false|
|size|string|null: false|
|delivery_fee|string|null: false|
|location_id|references|null: false, foreign_key: true|
|shopping_day|string|null: false|
|comment_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|


### Association
  belongs_to : user
  has_many : categorys, through: :item_category_relations
  has_many : comments
  


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|||
|item_id|||
|created_id|timestamp|null: false|

### Association
  belongs_to : user
  belongs_to : item





## categoryテーブル 
|Column|Type|Options|
|------|----|-------|
|name||null: false|
|parent_id||null: false|
 
### Association
  has_many : items, through: :item_category_relations







