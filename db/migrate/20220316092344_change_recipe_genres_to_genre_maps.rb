class ChangeRecipeGenresToGenreMaps < ActiveRecord::Migration[6.1]
  def change
    rename_table :recipe_genres, :genre_maps
  end
end
