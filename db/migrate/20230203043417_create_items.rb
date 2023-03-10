class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,              null: false
      t.integer    :place_category_id, null: false
      t.text       :memo,              null: false
      t.boolean    :shopping
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
