Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users
  resources :foods, except: [:edit, :update, :show]

  # Defines the root path route ("/")
  root "foods#index"
end
