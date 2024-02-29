Rails.application.routes.draw do  
  resources :users
  resources :movies
  resources :user_movies  

  get '/movies', to: "movies#index"
  post '/movies', to: "movies#create"
  post '/movies/many', to: "movies#createMany"

  get '/users', to: "users#index"
  post '/users', to: "users#create"
   
  get "up" => "rails/health#show", as: :rails_health_check  
end
