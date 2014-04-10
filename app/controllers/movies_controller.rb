class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc)
  end
end
