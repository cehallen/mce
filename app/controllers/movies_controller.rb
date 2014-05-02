class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      ParseWorker.perform_async(@movie.id)
      redirect_to movies_path, notice: 'Successfully added movie.'
    else
      flash.now[:alert] = 'Failed to add movie.'
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @words = @movie.words
  end

  private 

  def movie_params
    params.require(:movie).permit(:title, :subtitle_file_url)
  end

end
