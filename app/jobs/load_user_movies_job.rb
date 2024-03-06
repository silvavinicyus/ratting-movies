class LoadUserMoviesJob < ApplicationJob
  queue_as :default

  def perform(user_movies_params, current_user_id)
    Rails.logger.info "[JOB] Starting user movies loading"
    
    user_movies_params.each do |user_movie|
      @user_movie_exists = UserMovie.find_by(user_id: current_user_id, movie_id: user_movie['movie_id'])

      if @user_movie_exists == nil
        @user_movie_created = UserMovie.new(user_id: current_user_id, movie_id: user_movie['movie_id'], score: user_movie['score'])
      
        if @user_movie_created.save
          Rails.logger.info "User movie with id: #{user_movie['movie_id']} created!" 
        else
          Rails.logger.info "Error while creating user movie with id: #{user_movie['movie_id']}"     
        end
      else
        @user_movie_exists.update(score: user_movie['score'])
        Rails.logger.info "User movie with id: #{user_movie['movie_id']} updated!" 
      end 
    end

    Rails.logger.info "[JOB] Finished running load user movies"
  rescue StandardError => e
    Rails.logger.info "[JOB] Internal Error: " + e.to_s
  end
end
