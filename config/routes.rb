Rails.application.routes.draw do  
  # resources :users
  resources :movies
  # resources :user_movies  
  
  post '/sessions', to: "sessions#create"

  post '/movies/user/many', to: "user_movies#createMany"
  post '/movies/:movie_id', to: "user_movies#create"
  put '/movies/update/:movie_id', to: "user_movies#update"

  get '/movies', to: "movies#index"
  post '/movies', to: "movies#create"
  post '/many-movies', to: "movies#createMany"

  get '/users', to: "users#index"
  post '/users', to: "users#create"
  get '/users/movies', to: "user_movies#index"

  get "up" => "rails/health#show", as: :rails_health_check  
end
