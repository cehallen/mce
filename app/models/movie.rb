class Movie < ActiveRecord::Base
  has_many :sentences, dependent: :destroy
  has_many :sjoinws, through: :sentences
  has_many :words, through: :sjoinws
end
