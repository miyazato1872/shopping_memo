# アプリケーション名
Item Checker  

# アプリケーション概要
簡単な操作で家にある物の在庫管理ができ、それに連動して買い物のメモもが作成できる

# URL
https://shoppingmemo.onrender.com/

# テスト用アカウント
- Basic認証ユーザー名：admin
- Basic認証パスワード：33205338
- メールアドレス：test@test
- パスワード：a123456
- 

# 利用方法
## 在庫アイテムの登録
-----------------------------------------------------------------------------
1. トップページのヘッダーからユーザ新規登録を行う(またはテスト用アカウントでログインを行う)  
2. 「在庫リストに商品を登録」ボタンから、自宅にあるアイテムの登録を行う(アイテム名、カテゴリ、備考※任意)  
3. 登録したアイテムが、トップページのアイテム一覧にカテゴリ別で表示される  

## 買い物メモの登録
-----------------------------------------------------------------------------
1. 一覧アイテムのチェックボックスにチェックを入れて、「買い物メモに追加して保存」ボタンを押すとそのアイテムががメモリストに反映される(在庫アイテム一覧にもそのまま表示される)※実装途中
2. 買い物メモ一覧にて、買い物が完了したら更新ボタンを押すことで、買い物メモからは削除されて、在庫アイテム一覧ではチェックボックスが付いていない状態で更新される

# アプリケーションを作成した背景
子育てをしながら仕事をする主婦にヒアリングをし、「買い物の頻度が多くなってしまい大変」というが判明した。
課題を分析し、頻度が多くなる一番の理由として「買い忘れが発生してしまう」という深掘りを行った。さらに、メモアプリなどを活用してもやはり使い勝手が複雑で使わなくなることや、思いついたその時に気付いたものをメモするだけでは、チェック漏れが発生してしまうということからも、在庫一覧機能も必要だと仮説を立てた。  
時間をかけずにシンプルな操作と直感的に把握できる仕様が良いと考え、在庫管理と買い物のメモが複合したアプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1q6Yc2i6JEUnPgEhnpII-sUOQq9ODcdM79aYRgUm-SJY/edit#gid=198816517

# 実装した機能についての画像やGIFおよびその説明
- トップページのビュー画像  
[![Image from Gyazo](https://i.gyazo.com/780f4408fe00a0397f571c368ce87127.jpg)](https://gyazo.com/780f4408fe00a0397f571c368ce87127)  

- 在庫リストに登録して、カテゴリ別に登録される動画
[![Image from Gyazo](https://i.gyazo.com/594a90e41e108483d1ccfe162cdf4ac0.gif)](https://gyazo.com/594a90e41e108483d1ccfe162cdf4ac0)


# データベース設計(ER図)
[![Image from Gyazo](https://i.gyazo.com/acc4fc28c3147f16c0c4b98822c756c1.png)](https://gyazo.com/acc4fc28c3147f16c0c4b98822c756c1)

# 画面遷移図
- 献立機能については追加実装のため遷移図に記載しておりません  

[![Image from Gyazo](https://i.gyazo.com/c30ea251eeb1440c72d8f0a9b76a656b.png)](https://gyazo.com/c30ea251eeb1440c72d8f0a9b76a656b)

# 開発環境


# ローカルでの動作方法


# 工夫したポイント

# テーブル設計

## users テーブル
| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| password              | string | null: false               |
| introduction          | text   |                           |

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
- has_many : item_purchase_lists
- has_many : items, through: :item_purchase_lists


## item_purchase_lists テーブル(中間テーブル)
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| purchase_list | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :purchase_list


## items テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| place_category_id | integer    | null: false                    |
| memo              | text       |                                |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image
- has_many : item_purchase_lists
- has_many : purchase_lists, through: :item_purchase_lists




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

