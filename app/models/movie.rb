class Movie < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :subtitle_file_url, presence: true
  validates :user, presence: true
  
  belongs_to :user
  has_many :sentences, dependent: :destroy
  has_many :sjoinws, through: :sentences
  has_many :words, through: :sjoinws
  mount_uploader :subtitle_file_url, SubtitleFileUploader

  def word_counts
    words.select("words.content, count(*)")  # Like this: @movie.words...
      .group("words.content")
      .order("count(*) desc").map do |word|
        [word.content, word.count, Word.where("content = ?", word.content)]
      end
  end
end
