class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes
    favorites = Favorite.where(user_id: current_user.id).pluck(:recipe_id)
    @favorite_list = Recipe.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "編集内容を保存しました"
      redirect_to user_path(@user)      #ユーザマイページに戻る
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :is_deleted, :email, :nickname)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
