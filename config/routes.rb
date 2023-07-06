Rails.application.routes.draw do
  devise_for :users
  root 'public_recipes#index'
  # root to: "home#index"
   resources :recipes, only: [:index, :show, :create, :new, :destroy] do
     resources :recipe_foods, except: :update
   end
 
   resources :recipes do
     member do
       patch 'toggle_visibility'
     end
   end
 
 end
  