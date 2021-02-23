# テーブル設計
## usersテーブル
|Column                     | Type　|Options     |
|---------------------------- | -------- | ------------- |
| name                      | string | null: false |
| email                       | string | null: false |
| pasword                  | string | null: false |
| birthday                  | intrger | null: false |
| real_name_katakana | string | null: false |
### Association
 - has_many :items
 - has_one :buyer


## itemsテーブル
| Column    | Type          | Option                               |
| ------------- | --------------- | ------------------------------------ |
| image      | string        | null: false                           |
| title         | test           | null: false                           |
| text        | text            | null: false                           |
| category | string         | null: false                           |
| condition | string        | null: false                           |
| user        | references |null: false, foreign_key: true |
|buyer       | references |null: false, foreign_key: true |

### Association
 - belongs_to :user
 -  belongs_to :buer

 ## buyerテーブル
| Colum                | Typre         | Options                           |
| ------------------------ | ------------- | ------------------------------------ |
| card_information | integer      | null: false                           |
| expiration_date   | integer       | null: false                           |
| security_code     | integer       | null: false                           |
| user                    |references | null: false, foreign_key: true |
 ### Association
 - belongs_to :user
 - has_one : shippimg_address
 ### shipping_address
 | Colum              | Type        | Options                               |
 | --------------------- | ------------- | -------------------------------------- |
 | postal_code      | integer    | null: false                              |
 | prefecture       | string         | null: false                            |
 | municipalities   | string        | null: false                              |
 | address           | string        | null: false                              |
 | builing_name    | string        | null: false                             |
 | phone_number | string        | null: false                             |
 | buyer               | references | null: false, foreign_key: true | 
### Associaton
- belongs_to :buyer

