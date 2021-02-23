# テーブル設計
## usersテーブル
|Column                     | Type |Options     |
|---------------------------- | -------- | ------------- |
| name                      | string | null: false |
| email                       | string | null: false, unique: true |
| pasword                  | string | null: false |
| encrypted_password | string | null:false |
| birthday                  | date | null: false |
| last_name_katakana | string | null: false |
| name_katakana       | string | null: false |
### Association
 - has_many :items
 - has_one :buyer


## itemsテーブル
| Column    | Type          | Option                               |
| ------------- | --------------- | ------------------------------------ |
| image      | string        | null: false                           |
| title         | test           | null: false                           |
| text        | text            | null: false                           |
| category_id | integer       | null: false                           |
| condition_id | integer        | null: false                           |
| burden_id     | integer        |null: false                         |
| area_id         | integer        |null: false                        |
| days_id         | integer        | null: false                    |
| user        | references |null: false, foreign_key: true |
|buyer       | references |null: false, foreign_key: true |

### Association
 - belongs_to :user
 -  belongs_to :buyer

 ## buyerテーブル
| Colum                | Typre         | Options                           |
| ------------------------ | ------------- | ------------------------------------ |
| user                    |references | null: false, foreign_key: true |
 ### Association
 - belongs_to :user
 - has_one : shippimg_address
 ### shipping_address
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

