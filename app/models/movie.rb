class Movie < ActiveRecord::Base
  has_many :sentences
  has_many :sjoinws, through: :sentences
  has_many :words, through: :sjoinws
end
