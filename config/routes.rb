Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  root 'static_pages#home'
  # root 'posts#index'
  resources :posts
  devise_for :users

  # devise_scope :users do
  #
  #     # post '/users/sign_in' => 'posts#new'
  #     # get '/users/sign_in' => 'posts#new'
  #     # get '/users/sign_up' => 'posts#new'
  #
  #   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
