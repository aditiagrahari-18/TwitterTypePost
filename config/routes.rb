Rails.application.routes.draw do

  get 'comments/create'
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#allpost'
  get 'microposts/post_form'
  post 'microposts/post_form'

  devise_for :users
  resources :users do
    resources :blocks, only: [:create, :destroy]
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: [:create, :destroy] do
    post :like, :dislike
    resources :comments
  end

  resources :relationships, only: [:create, :destroy]

  # post 'comments/create'
  # get 'comments/show'
  # devise_scope :users do
  # root 'posts#index'
  #     # post '/users/sign_in' => 'posts#new'
  #     # get '/users/sign_in' => 'posts#new'
  #     # get '/users/sign_up' => 'posts#new'
  #
  #   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
