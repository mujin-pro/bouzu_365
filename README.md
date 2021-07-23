## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| mission            | string |                           |

### Association
has_many :checks
has_many :routines
has_many :Donations

## checksテーブル

| Column    | Type         | Options                        |
| --------  | ------------ | ------------------------------ |
| check_in  | timestamp    |                                |
| check_out | timestamp    |                                |
| skip      | integer      |                                |
| user      | references   | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :donation
has_one :routine

## donationsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| check   | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :check

## routinesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ | 
| sleep_id     | integer    |                                |
| bath_id      | integer    |                                |
| light_id     | integer    |                                |
| dinner_id    | integer    |                                |
| caffeine_id  | integer    |                                |
| alcohol_id   | integer    |                                |
| user         | references | null: false, foreign_key: true |
| check        | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :check