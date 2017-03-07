Rails.application.routes.draw do
  devise_for :users
  resources :bars
  resources :reviews
  root 'bars#index'
end
