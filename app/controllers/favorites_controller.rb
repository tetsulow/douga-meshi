class FavoritesController < ApplicationController
  def create     #いいね追加
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: @recipe.id)
    favorite.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id]) #いいね削除
    favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
  end
end
