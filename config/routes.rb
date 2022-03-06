Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get "search" => "recipes#search"

  resources :recipes, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resources :recipe_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :delete]do
     get :favorites, on: :collection
  end

end
