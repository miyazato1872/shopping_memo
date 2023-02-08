class ItemShopping < ApplicationRecord
  
    # アソシエーション
  belongs_to :item
  belongs_to :shopping
end
