class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render json: @movies
  end  

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, location: @movie
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def createMany 
    LoadMoviesJob.perform_later(many_movies_params)

    render json: {"Message": "Movies will be loaded in background!"}, status: :ok
  end

  private 

  def movie_params
    params.require(:movie).permit(:title, :director)
  end

  def many_movies_params
    params.permit(movies: [:title, :director]).require(:movies)
  end
end