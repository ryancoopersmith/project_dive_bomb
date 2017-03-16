Rails.application.routes.draw do
  devise_for :users

  resources :bars do
    resources :reviews
  end

  match "*all" => "application#cors_preflight_check", :constraints => { :method => "OPTIONS" }

  root 'bars#index'

  namespace :api do
    namespace :v1 do
      resources :bars
    end
  end
end
