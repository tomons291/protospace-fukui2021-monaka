# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | string | null: false |
| affiliation        | string | null: false |
| position           | string | null: false |

### Association
- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column    | Type       | Options                        |
| --------  | ---------- | ------------------------------ |
| title     | string     | null: false                    |
| concept   | text       | null: false                    |
| catchcopy | string     | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       |                                |
| user         | references | null: false, foreign_key: true |
| prototype    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :prototype