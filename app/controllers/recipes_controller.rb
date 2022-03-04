class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "新しいレシピを投稿しました"
    else
      render :index
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
     redirect_to recipe_path(@recipe), notice: "You have updated book successfully."
    else
     render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :caption, :image)
  end

end
