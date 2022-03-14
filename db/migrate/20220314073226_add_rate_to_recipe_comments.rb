class AddRateToRecipeComments < ActiveRecord::Migration[6.1]
  def change
    add_column :recipe_comments, :rate, :float
  end
end
