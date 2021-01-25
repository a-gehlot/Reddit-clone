Rails.application.routes.draw do
  resources :post_subs
  resources :posts, except: [:index] do
    resources :upvote, only: [:create]
    resources :downvote, only: [:create]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :subs, except: [:destroy] do
    resources :upvote, only: [:create]
    resources :downvote, only: [:create] 
  end
  resources :comments, only: [:create, :show]
  # resources :comments, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
end
