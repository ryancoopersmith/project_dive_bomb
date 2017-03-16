Rails.application.routes.draw do
  devise_for :users

  resources :bars do
    resources :reviews
  end

  post 'reviews/upvote'
  post 'reviews/downvote'

  root 'bars#index'

  namespace :api do
    namespace :v1 do
      resources :bars
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reviews
    end
  end
end
