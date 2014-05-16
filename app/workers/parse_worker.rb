class ParseWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5
  
  def perform(movie_id)
    movie = Movie.find(movie_id)
    script = movie.subtitle_file_url.read

    c = SubtitleParse.new
    context_blocks = c.array_sentences(script) # See subtitle_parse model

    context_blocks.each do |block|
      Sentence.create(movie: movie, 
        number: block['number'], 
        time_marker: block['time_marker'], 
        content: block['content'])
    end

    sentences = movie.sentences
    
    # Word object creation
    sentences.each do |sentence| 
      sentence.content.split.each do |word| 
        word = word.downcase.gsub(/\A\W+|\W+\z/, '')  # Remove punctuation on word ends
        next if word.length < 2 
        skip_these_words = %w(
          the of to and in is it you that was for on are
          ) 
        next if skip_these_words.include?(word)
        
        word_entry = Word.where(content: word).first_or_initialize
        word_entry.frequency += 1
        word_entry.save 
        word_entry.sjoinws.create(sentence: sentence) # Create join entry
      end
    end
  end
end
