Rails.application.routes.draw do
  # resources :friendships
  namespace :api do
    namespace :v1 do
      resources :rides
      resources :messages
      resources :user_companies
      resources :forums
      resources :companies
      resources :friendships
      post "/login", to: "auth#login"
      get '/auto_login', to: "auth#auto_login"
      resources :users do
        member do
          get :following, :followers
          post "/imageupload", to: "users#image_upload"
        end
      end

    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
