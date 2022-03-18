Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get "search" => "recipes#search"
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  resources :recipes, only: [:new, :create, :index, :show, :edit, :update, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resources :recipe_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :delete]do
    get :favorites, on: :collection
  end

  resources :contacts, only: [:new, :create]

  resources :genres do
    get 'recipes', to: 'recipes#genre'
  end

end
