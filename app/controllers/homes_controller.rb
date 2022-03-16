class HomesController < ApplicationController

  layout "top_layout"

  def top
    @recipes = Recipe.order(created_at: :desc).limit(5)
  end

end
