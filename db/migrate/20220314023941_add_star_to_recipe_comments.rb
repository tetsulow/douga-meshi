class AddStarToRecipeComments < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_comments, :star, :string
  end
end
