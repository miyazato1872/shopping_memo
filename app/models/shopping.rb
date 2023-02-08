class Shopping < ApplicationRecord
  
    # アソシエーション
  belongs_to :user
  has_many :item_shoppings
  has_many :items, through: :item_shoppings
end
