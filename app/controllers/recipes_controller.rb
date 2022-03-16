class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    genre_list = params[:recipe][:genre_name].split(nil)
    if @recipe.save
      @recipe.save_genre(genre_list)
      redirect_to recipe_path(@recipe), notice: "新しいレシピを投稿しました"
    else
      render :show
    end
  end

  def index
    @recipes = Recipe.all
    @genres = Genre.all               #ビューで投稿一覧を表示するために全取得。
  end

  def search
    @recipes = Recipe.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @recipe_genres = @recipe.genres
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.user_id = current_user.id
    genre_list = params[:recipe][:genre_name].split(nil)
    if @recipe.update(recipe_params)
     @recipe.save_genre(genre_list)
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
