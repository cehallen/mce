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
      redirect_to movies_path, notice: 'Successfully added movie.  Ready in a moment!'
    else
      notice[:alert] = 'Failed to add movie.'
      render :new
    end
  end

  # def create
  #   if params[:movie][:subtitle_file_url].nil? && params[:movie][:title] == ''
  #     return redirect_to new_movie_path, 
  #       notice: 'Please input both items'
  #   end
  #   if params[:movie][:subtitle_file_url].nil?
  #     return redirect_to new_movie_path,
  #       title: params[:movie][:title],
  #       notice: 'Please upload a subtitle file'
  #   end
  #   if params[:movie][:title] == ''
  #     return redirect_to new_movie_path,
  #     notice: "Please try again (remember the title)"
  #   end

  #   title = params[:movie][:title]

  #   # script = params[:movie][:script].read #old way that works non-aws

  #   # works but just does it the old way.
  #   script = params[:movie][:subtitle_file_url].read
  #   # 
  #   # CarrierWave::Uploader#url  


  #   @movie = Movie.new(title: title)

  #   # Sentence object creation
  #   c = SubtitleParse.new
  #   context_blocks = c.array_sentences(script) # See subtitle_parse model

  #   context_blocks.each do |block|
  #     Sentence.create(movie: @movie, 
  #       number: block['number'], 
  #       time_marker: block['time_marker'], 
  #       content: block['content'])
  #   end

  #   sentences = @movie.sentences
    
  #   # Word object creation
  #   sentences.each do |sentence| 
  #     sentence.content.split.each do |word| 
  #       word = word.downcase.gsub(/\A\W+|\W+\z/, '')
  #       next if word.length < 2 
  #       skip_these_words = %w(
  #         the of to and in is it you that was for on are
  #         ) 
  #       next if skip_these_words.include?(word)
        
  #       word_entry = Word.where(content: word).first_or_initialize
  #       word_entry.frequency += 1
  #       word_entry.save 
  #       word_entry.sjoinws.create(sentence: sentence) # Create join entry
  #     end

  #   end
  #   if @movie.save
  #     redirect_to movie_path(@movie),
  #       notice: 'Your movie is ready!'
  #   else
  #     render :new
  #   end
  # end

  def show
    @movie = Movie.find(params[:id])
    @words = @movie.words
  end

  private 

  def movie_params
    params.require(:movie).permit(:title, :subtitle_file_url)
  end

end
