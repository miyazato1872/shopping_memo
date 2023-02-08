class CreateItemShoppings < ActiveRecord::Migration[6.0]
  def change
    create_table :item_shoppings do |t|
      t.references :item,              null: false, foreign_key: true
      t.references :shopping,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
