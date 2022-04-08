class HomesController < ApplicationController

  layout "top_layout"

  def top
    @recipes = Recipe.order(created_at: :desc).limit(5)
    @genres = Genre.order("RANDOM()").limit(7) #タグをランダムで７つ表示
  end

end
