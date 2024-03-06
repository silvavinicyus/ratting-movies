class UserMoviesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])

    current_user.movies << @movie
    @user_movie = current_user.user_movies.find_by(movie_id: @movie.id)    
    @user_movie.update(score: params[:score])            

    render json: {ok: "Ok"}, status: :ok
  end

  def update
    @user_movie = current_user.user_movies.find_by(movie_id: params[:movie_id])

    if @user_movie == nil 
      render json: {message: "You haven't rated this movie yet."}, status: :bad_request
    else
      @user_movie.update(score: params[:score])
      render json: {}, status: :no_content
    end      

  end

  def createMany      
    file = JSON.parse(params[:file].read)    

    LoadUserMoviesJob.perform_later(file['user_movies'], current_user.id)

    render json: {Message: "User movies will be loaded in background!"}, status: :ok
  end

  def index
    movies_with_average_by_id = Movie.select("movies.*, COALESCE(ROUND(AVG(user_movies.score), 1), 0.0) AS score")
    .left_outer_joins(:user_movies)
    .where(user_movies: { user_id: current_user.id })
    .group("movies.id")

    render json: movies_with_average_by_id
  end
end
