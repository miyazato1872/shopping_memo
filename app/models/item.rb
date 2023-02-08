class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  # アソシエーション
  belongs_to :place_category
  belongs_to :user
  has_many :item_shoppings
  has_many :shoppings, through: :item_shoppings

  # バリデーション
  validates :name, presence: true  # 空では登録できない
  validates :place_category_id, presence: true  # 空では登録できない
  validates :place_category_id,        numericality: { other_than: 1 , message: "can't be blank" }
end
