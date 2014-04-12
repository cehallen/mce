class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc)
  end

  def show
    @movie = Movie.find(params[:id])
    @sentences = @movie.sentences
  end

  def new
    @movie = Movie.new
  end

  def create
    # is srt getting deleted after? where is it, rails root?  nowhere?
    # where should I put all this fat controller ruby- helper/module?
    # how can I confirm .srt valid format?
    title = params[:movie][:title]
    script = params[:movie][:script].read
    @movie = Movie.new(title: title)

    # Sentence object creation
    script = script.split(/^\s*$/) 
    script.each do |entry|
      line = entry.strip.split("\n")
      number = line[0]
      time_marker =  line[1][0..7]
      content = line[2..-1].join("\n")
      Sentence.create(movie: @movie, number: number, 
        time_marker: time_marker, content: content)
    end

    # Word object creation

    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end
end
