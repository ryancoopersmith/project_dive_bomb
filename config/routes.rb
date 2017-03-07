Rails.application.routes.draw do
  devise_for :users
  resources :bars
  root 'bars#index'
end
