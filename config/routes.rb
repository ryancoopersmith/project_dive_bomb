Rails.application.routes.draw do
  devise_for :users

  resources :bars do
    resources :reviews do
      member do
        put "like", to: "reviews#upvote"
        put "dislike", to: "reviews#downvote"
      end
    end
  end

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
