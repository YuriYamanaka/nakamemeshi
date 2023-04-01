Rails.application.routes.draw do
  get 'room/show'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]

  resources :foods do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

  resources :messages, :only => [:create]
  
  resources :rooms, :only => [:create, :show]
  
  root 'foods#index'
end
