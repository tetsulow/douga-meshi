class RecipesController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "新しいレシピを投稿しました"
    else
      render :show
    end
  end

  def index
    @recipes = Recipe.all
  end

  def search
    @recipes = Recipe.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
     redirect_to recipe_path(@recipe), notice: "レシピ内容が更新されました"
    else
     render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :caption, :image)
  end

   def ensure_correct_user
     @recipe = Recipe.find(params[:id])
      unless @recipe.user == current_user
        redirect_to recipes_path
      end
   end

end
