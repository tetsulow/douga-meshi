Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/edit'
  get 'recipes/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'homes#top'
  resources :users, only: [:show, :edit, :update, :delete]
  resources :recipes, only: [:new, :create, :index, :show, :edit, :update]
end
