class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  # def upload
  #   uploaded_io = params[:person][:picture]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  #     file.write(uploaded_io.read)
  #   end
  # end

  def create
    # is this file getting deleted after? where is it, rails root?  nowhere?
    title = params[:movie][:title]
    script = params[:movie][:script].read
    @movie = Movie.new(title: title, script: script)

    # gem to break into unpolished array of sentences
    m = TactfulTokenizer::Model.new
    sentences = m.tokenize_text(script)

    # create sentence objects
    sentences.each do |sentence|
      number = nil #must convert str->int
      time_marker = nil
      movie = @movie
      content = nil
      if sentence

      end
    end
    binding.pry

    if @movie.save # and words.save and sentences.save
      redirect_to movies_path
    else
      render :new
    end
    
  end

  # private

  # def movie_params
  #   params.require(:movie)
  #     .permit(:title)
  # end
end
