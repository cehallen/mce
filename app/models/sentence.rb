class Sentence < ActiveRecord::Base
  validates :content, presence: true
  validates :time_marker, presence: true
  validates :movie, presence: true
  belongs_to :movie
  has_many :words, through: :sjoinws, dependent: :destroy
  has_many :sjoinws, dependent: :destroy
end
