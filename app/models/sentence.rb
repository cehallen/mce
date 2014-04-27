class Sentence < ActiveRecord::Base
  validates :content, presence: true
  validates :time_marker, presence: true
  validates :movie, presence: true
  validates :number, presence: true
  
  belongs_to :movie
  has_many :words, through: :sjoinws, dependent: :destroy
  has_many :sjoinws, dependent: :destroy

  def previous
    previous_num = self.number - 1
    movie_id = self.movie_id
    Sentence.where("movie_id = #{movie_id} AND number = #{previous_num}")
  end

  def following
    following_num = self.number + 1
    movie_id = self.movie_id
    Sentence.where("movie_id = #{movie_id} AND number = #{following_num}")
  end
end
