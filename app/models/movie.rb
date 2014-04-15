class Movie < ActiveRecord::Base
  has_many :sentences, dependent: :destroy
  has_many :sjoinws, through: :sentences
  has_many :words, through: :sjoinws

  def word_counts
    words.select("words.content, count(*)")
      .group("words.content")
      .order("count(*) desc").map do |word|
      [word.content, word.count]
    end
  end
end


