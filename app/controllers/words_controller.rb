class WordsController < ApplicationController
  
  # This action can handle both 
  # /words/:id
  # and
  # /movies/:movie_id/words/:id
  def show
    @word = Word.find(params[:id])

    if params[:movie_id]
      @movie = Movie.find(params[:movie_id])
      @sentences = @movie.sentences
        .joins(:sjoinws).where(sjoinws: { word: @word })
    else
      @sentences = @word.sentences
    end  

  end
end


# @sentence = Sentence.find(params[:id])
# @preceding_sentence = Sentence.where(
#   "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number - 1}")
# @following_sentence = Sentence.where(
#   "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number + 1}")
