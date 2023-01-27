# テーブル設計

## users テーブル
| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| Introduction          | text   |                           |

### Association
- has_many :items
- has_many :menus
- has_one :purchase_list
- has_one_attached :image


## purchase_lists テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :items  
- has_one_attached :image


## items テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| place_category_id | integer    | null: false                    |
| memo              | text       |                                |
| purchase_list_id  | integer    |                                |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchase_list
- has_one_attached :image



## menus テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| recipe_link   | text       | null: false                    |
| main_genre_id | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :menu_tags
- has_many :tags, through: :menu_tags


## menu_tags テーブル(中間テーブル)
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| menu          | references | null: false, foreign_key: true |
| tag           | references | null: false, foreign_key: true |

### Association
- belongs_to :menu
- belongs_to :tag


## tags テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| recipe_link   | text       | null: false                    |
| main_genre_id | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
- has_many :menu_tags
- has_many :menus, through: :menu_tags