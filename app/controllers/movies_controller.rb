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

  # def upload
  #   uploaded_io = params[:person][:picture]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  #     file.write(uploaded_io.read)
  #   end
  # end

  def create
    # is this file getting deleted after? where is it, rails root?  nowhere?
    # where should I put all this fat controller ruby, in a helper in lib?
    # how can I confirm .srt valid format?
    title = params[:movie][:title]
    script = params[:movie][:script].read
    @movie = Movie.new(title: title)

    
    # Create sentence objects
    script = script.split(/^\s*$/) # Split on empty lines
    # File.read('subtitles.srt').split(/^\s*$/).each do |entry| # Read in the entire text and split on empty lines
    script.each do |entry|
      line = entry.strip.split("\n")
      number = line[0] # First element after empty line is 'number'
      time_marker =  line[1][0..7] # Second element is 'time_marker'
      content = line[2..-1].join("\n") # Everything after that is 'content'
      Sentence.create(movie: @movie, number: number, 
        time_marker: time_marker, content: content)
    end
    binding.pry
    if @movie.save # and words.save and sentences.save?
      redirect_to movies_path
    else
      render :new
    end

    # # my messy version of the above
    # script.each_line do |line|
    #   line = line.strip
    #   if line =~ /^\d+$/
    #     number = line.to_i
    #   elsif line =~ /-->/
    #     time_marker = line[0..7]
    #   elsif line =~ /^\b\D/
    #     ### must alter this to include punctuation like '' or "", etc
    #     content << line
    #   else
    #     if content.size > 1
    #       content = content.join("\n") 
    #     else
    #       content = content[0]
    #     end
    #     Sentence.create(movie: @movie, number: number, 
    #       time_marker: time_marker, content: content)
    #     content = []
    #   end
    # end
    # binding.pry
    
    
    # sentences = Sentence.all
    # binding.pry
  end
#########
# File.read('subtitles.srt').split(/^\s*$/).each do |entry| # Read in the entire text and split on empty lines
#   sentence = entry.strip.split("\n")
#   number = sentence[0] # First element after empty line is 'number'
#   time_marker =  sentence[1][0..7] # Second element is 'time_marker'
#   content = sentence[2..-1].join("\n") # Everything after that is 'content'
# end
###########


  # private

  # def movie_params
  #   params.require(:movie)
  #     .permit(:title)
  # end
end
