Rails.application.routes.draw do
  devise_for :users

  resources :bars do
    resources :reviews
  end

  root 'bars#index'

  namespace :api do
    namespace :v1 do
      resources :bars do
        resources :reviews
      end
    end
  end
end
