class SentencesController < ApplicationController
  def show
    @sentence = Sentence.find(params[:id])
    @preceding_sentence = Sentence.where(
      "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number - 1}")
    @following_sentence = Sentence.where(
      "movie_id = #{@sentence.movie_id} AND number = #{@sentence.number + 1}")
  end
end


# TownHealthRecord.select("town, percent_teen_births_2005_to_2008").where("percent_teen_births_2005_to_2008 IS NOT NULL AND town != 'Boston' AND town != 'Becket' AND town != 'Beverly'").order("percent_teen_births_2005_to_2008 DESC").limit(1)
