Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#home'
  get 'microposts/post_form'
  post 'microposts/post_form'

  devise_for :users
  resources :users
  resources :microposts, only: [:create, :destroy]
  # devise_scope :users do
  # root 'posts#index'
  #     # post '/users/sign_in' => 'posts#new'
  #     # get '/users/sign_in' => 'posts#new'
  #     # get '/users/sign_up' => 'posts#new'
  #
  #   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
