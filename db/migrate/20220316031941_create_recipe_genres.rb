class CreateRecipeGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_genres do |t|
      t.integer :genre_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
