Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    resources :lists, param: :slug
    resources :todos, only: [:create, :update]
  end
  
  match '*path', to: 'home#index', via: :all
end
