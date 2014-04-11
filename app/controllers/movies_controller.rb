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
    # where should I put all this fat controller ruby, in a helper in lib?

    title = params[:movie][:title]
    script = params[:movie][:script].read
    @movie = Movie.new(title: title, script: script)

    # gem to break into unpolished array of sentences
    m = TactfulTokenizer::Model.new
    sentences = m.tokenize_text(script)

    # create sentence objects
    number = nil
    time_marker = nil
    content = []
    sentences.each do |sentence|
      if sentence =~ /\A\d+\z/
        number = sentence.to_i
      elsif sentence =~ /-->/
        time_marker = sentence[0..7]
      else
        content << sentence
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
