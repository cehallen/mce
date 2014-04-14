class WordsController < ApplicationController
  def show
    # very similar to sentence show.  could combine them, maybe
    @word = Word.find(params[:id])
    @sentences = @word.sentences # be careful, there could be many sentences for some words
    
  end
end


# @sentence = Sentence.find(params[:id])
# @preceding_sentence = Sentence.where(
#   "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number - 1}")
# @following_sentence = Sentence.where(
#   "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number + 1}")
