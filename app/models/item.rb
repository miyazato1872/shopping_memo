class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  # アソシエーション
  belongs_to :place_category
  belongs_to :user

  # バリデーション
  validates :name, presence: true  # 空では登録できない
  validates :place_category_id, presence: true  # 空では登録できない
  validates :place_category_id,        numericality: { other_than: 1 , message: "can't be blank" }
end
