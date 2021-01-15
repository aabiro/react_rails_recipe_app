Rails.application.routes.draw do
  root 'app#index'

  namespace :api do
    get 'ingredients', to: 'ingredients#index'
    get 'recipes', to: 'recipes#index'
    post 'recipes', to: 'recipes#create'
  end
end
