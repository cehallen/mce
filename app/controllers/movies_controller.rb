class MoviesController < ApplicationController
  def index
    @movies = Movie.order(created_at: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
    # is srt getting deleted after? where is it, rails root?  nowhere?
      # @tempfile=#<Tempfile:/var/folders/b9/6w0shc9d1sn0hpyl84z71bvm0000gn/T/RackMultipart20140413-81782-zq8kh8>
    # where should I put all this fat controller ruby- helper/module? class?
    # how can I confirm .srt valid format?
      # @content_type="application/octet-stream"
    # how can I confirm valid Word/Sentence creation on @movie.save?
      # otherwise if the srt file is corrupt, and errors occur, the user will get a red screen.  i want to show them a redirect... some kind of x.new -> if x.save flow. 
    if params[:movie][:script].nil? && params[:movie][:title] == ''
      return redirect_to new_movie_path, 
        notice: 'Please input both items!'
    end
    if params[:movie][:script].nil?
      return redirect_to new_movie_path,
        title: params[:movie][:title],
        notice: 'Please upload a subtitle file'
    end
    if params[:movie][:title] == ''
      return redirect_to new_movie_path,
      # script: params[:movie][:script], #this didn't work
      notice: "Please try again (remember the title)"
    end

    title = params[:movie][:title]
    script = params[:movie][:script].read
    @movie = Movie.new(title: title)

    # Sentence object creation
    script = script.strip.split(/^\s*$/) 
    script.each do |entry|
      line = entry.strip.split("\n")
      number = line[0]
      time_marker =  line[1][0..7]
      content = line[2..-1].join("\n")
      Sentence.create(movie: @movie, number: number, 
        time_marker: time_marker, content: content)
    end

    # Word object creation
    # [need to have an excluded words list]
    # [need frequency += 1 or new word created.  find or create by?]
    # example of creating join entry:
    # User has_many :subscriptions
    # User has_many :magazines, through: :subscriptions
    # user.subscriptions.create(magazine: magazine)
    # <word>.sjoinw.create(sentence: <sentence>)
    # do something like above, and also find_or_create_by and += to frequency count
    sentences = @movie.sentences
    
    sentences.each do |sentence| 
      sentence.content.split.each do |word| 
        word = word.downcase.gsub(/\A\W+|\W+\z/, '')
        next if word.length < 2 
        # skip_these_words = %w(the of to and in is it you that he was for on are) 
        # next if skip_these_words.include?(word)
        # # [actually, don't want to omit these bc there aren't many, and could be useful for beginner learners]
        word_entry = Word.where(content: word).first_or_initialize
        word_entry.frequency += 1
        word_entry.save 
        word_entry.sjoinws.create(sentence: sentence) # Create join entry
      end

    end
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @words = @movie.words
  end
end
