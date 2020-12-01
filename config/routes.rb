Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :user_plants, only: [:create, :update]
      resources :plants, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/search/:slug', to: 'plants#plant_info'
      get '/search', to: 'plants#search'
    end
  end
end
