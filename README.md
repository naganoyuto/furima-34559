# テーブル設計
## usersテーブル
|Column                     | Type |Options     |
|---------------------------- | -------- | ------------- |
| nickname                      | string | null: false |
| email                       | string | null: false, unique: true |
| encrypted_password | string | null:false |
| birthday                  | date | null: false |
| last_name                 | string | null: false |
| name                       | string | null: false|
| last_name_katakana | string | null: false |
| name_katakana       | string | null: false |
### Association
 - has_many :items
 - has_many :buyers


## itemsテーブル
| Column    | Type          | Option                               |
| ------------- | --------------- | ------------------------------------ |
| title         | string           | null: false                           |
| text        | text            | null: false                           |
| category_id | integer       | null: false                           |
| condition_id | integer        | null: false                           |
| burden_id     | integer        |null: false                         |
| area_id         | integer        |null: false                        |
| day_id         | integer        | null: false                    |
| price          | integer         | null: false                     |
| user        | references |null: false, foreign_key: true |


### Association
 - belongs_to :user
 -  has_one :buyer

 ## buyersテーブル
| Colum | Typre         | Options                           |
| --------- | ------------- | ------------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
 ### Association
 - belongs_to :user
 - belongs_to :item
 - has_one : shipping_address
 ### shipping_addressesテーブル
 | Colum              | Type        | Options                               |
 | --------------------- | ------------- | -------------------------------------- |
 | postal_code      | string    | null: false                              |
 | prefecture_id   | integer        | null: false                            |
 | municipalities   | string        | null: false                              |
 | address           | string        | null: false                              |
 | builing_name    | string        |                                        |
 | phone_number | string        | null: false                            |
 | buyer               | references | null: false, foreign_key: true | 
### Associaton
- belongs_to :buyer

