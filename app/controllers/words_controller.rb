class WordsController < ApplicationController
  
  # This action can handle both 
  # /words/:id
  # and
  # /movies/:movie_id/words/:id
  def show
    @word = Word.find(params[:id])

    # For use in view, to prevent edge case failure on last sentence in film
    @max_number_sentence = Sentence.order(number: :desc).limit(1)

    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @sentences = @movie.sentences
        .joins(:sjoinws).where(sjoinws: { word: @word })
    else
      @sentences = @word.sentences
    end  

    sentences_context_blocks = []
    @sentences.each do |sentence|
      sentences_context_blocks << {
        time_marker: sentence.time_marker,
        previous: sentence.previous.first.content,
        content: sentence.content,
        following: sentence.following.first.content
      }
    end

    respond_to do |format|
      format.html
      format.json { render json: {sentences: sentences_context_blocks, word: @word.content} }
    end
  end
end
