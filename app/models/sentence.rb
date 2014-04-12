class Sentence < ActiveRecord::Base
  validates :content, presence: true
  validates :time_marker, presence: true
  validates :movie, presence: true
  belongs_to :movie
  has_many :words, through: :s_join_ws
end
