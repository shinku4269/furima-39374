## usersテーブル

|Column              |Type  |Options                  |
|--------------------|------|-------------------------|
|nickname            |string|null: false              |
|email               |string|null: false, unique: true|
|encrypted_password  |string|null: false              |
|family_name         |string|null: false              |
|first_name          |string|null: false              |
|family_name_furigana|string|null: false              |
|first_name_furigana |string|null: false              |
|birth_day           |date  |null: false              |


### Association

- has_many :items
- has_many :purchases


## itemsテーブル

|Column             |Type      |Options                      |
|-------------------|----------|-----------------------------|
|name               |string    |null: false                  |
|description        |text      |null: false                  |
|price              |integer   |null: false                  |
|category_id        |integer   |null: false                  |
|status_id          |integer   |null: false                  |
|shipping_charges_id|integer   |null: false                  |
|shipping_area_id   |integer   |null: false                  |
|shipping_day_id    |integer   |null: false                  |
|user               |references|null: false, foreign_key:true|


### Association

- belongs_to :user
- has_one :purchase


## purchasesテーブル

|Column|Type      |Options                      |
|------|----------|-----------------------------|
|item  |references|null: false, foreign_key:true|
|user  |references|null: false, foreign_key:true|


### Association

- belongs_to :user
- belongs_to :item
- has_one :destination


## destinationsテーブル

|Column           |Type      |Options                      |
|---------------- |----------|-----------------------------|
|post_code        |string    |null: false                  |
|shipping_area_id |integer   |null: false                  |
|city             |string    |null: false                  |
|address          |string    |null: false                  |
|building_name    |string    |                             |
|phone_number     |string    |null: false                  |
|purchase         |references|null: false, foreign_key:true|


### Association

- belongs_to :purchase