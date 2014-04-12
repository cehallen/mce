class SentencesController < ApplicationController
  def show
    @sentence = Sentence.find(params[:id])
    @preceding_sentence = Sentence.where(
      "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number - 1}")
    @following_sentence = Sentence.where(
      "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number + 1}")
  end
end
