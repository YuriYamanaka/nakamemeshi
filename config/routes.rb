Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  resources :foods do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  root 'foods#index'
end
