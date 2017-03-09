Rails.application.routes.draw do
  devise_for :users

  resources :bars do
    resources :reviews
  end

  root 'bars#index'
end
