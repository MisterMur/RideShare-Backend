Rails.application.routes.draw do
  # resources :friendships
  namespace :api do
    namespace :v1 do
      resources :rides
      resources :messages
      resources :user_companies
      resources :users
      resources :forums
      resources :companies
      resources :friendships
      post "/login", to: "auth#login"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
