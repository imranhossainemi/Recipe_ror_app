Rails.application.routes.draw do
  get 'recipes/index', to: 'recipes#index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "recipes#index"
end
