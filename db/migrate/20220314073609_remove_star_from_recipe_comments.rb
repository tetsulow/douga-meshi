class RemoveStarFromRecipeComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipe_comments, :star, :string
  end
end
