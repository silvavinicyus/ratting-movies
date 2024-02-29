class LoadMoviesJob < ApplicationJob
  queue_as :default

  def perform(movies_params)
    Rails.logger.info "Starting loading job"
    @movies = Movie.create(movies_params)

    if @movies.any? {|movie| movie.errors.any? }
      errors = @movies.map(&:errors)
      Rails.logger.info "Error while running backgroung movies load.\n Errors: " + errors.to_s
    end

    Rails.logger.info "Finished loading movies"
  rescue StandardError => e
    Rails.logger.info e.to_s
  end
end
