Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users
  resources :foods, except: [:edit, :update, :show]
  resources :recipes, only: [:index, :show, :create, :new, :destroy] do
    resources :recipe_foods, except: :update
  end
  
  resources :recipes do
    member do
      patch 'toggle_visibility'
    end
  end
  
  # Defines the root path route ("/")
  root 'public_recipes#index'
  resources :shopping_lists, only: [:index]
 end
  
