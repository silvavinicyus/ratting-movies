class LoadMoviesJob < ApplicationJob
  queue_as :default

  def perform(movies_params)
    Rails.logger.info "Starting loading job"
    @movies = Movie.create(movies_params)   

    Rails.logger.info "Finished loading movies"
  rescue StandardError => e
    Rails.logger.info e.to_s
  end
end
