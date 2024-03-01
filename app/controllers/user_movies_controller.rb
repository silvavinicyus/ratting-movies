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
    Rails.logger.info many_user_movies_params

    LoadUserMoviesJob.perform_later(many_user_movies_params, current_user.id)

    render json: {Message: "User movies will be loaded in background!"}, status: :ok
  end

  def many_user_movies_params
    params.permit(user_movies: [:movie_id, :score]).require(:user_movies)
  end
end
