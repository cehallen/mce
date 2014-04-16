class Movie < ActiveRecord::Base
  has_many :sentences, dependent: :destroy
  has_many :sjoinws, through: :sentences
  has_many :words, through: :sjoinws

  def word_counts
    words.select("words.content, count(*)")
      .group("words.content")
      .order("count(*) desc").map do |word|
        [word.content, word.count, Word.where("content = ?", word.content)]
      end
  end
end

# untarnished
# words.select("words.content, count(*)")
#   .group("words.content")
#   .order("count(*) desc").map do |word|
#   [word.content, word.count]
# end

# def word_counts
#   words.select("words.content, count(*)")
#     .group("words.content")
#     .order("count(*) desc").map do |word|
#       [word.content, word.count, word]  #Didn't give full word object info..
#     end
# end
