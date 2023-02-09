class ItemShopping < ApplicationRecord
  belongs_to :item
  belongs_to :shopping
end
