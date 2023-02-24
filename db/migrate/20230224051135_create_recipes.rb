class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string      :title,            null: false
      t.integer      :author_id,        null: false
      t.integer     :food_category_id, null: false
      t.integer     :food_genre_id,    null: false
      t.text        :make
      t.string      :reference_url
      t.string      :cook_time
      t.string      :other_time
      t.references  :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
