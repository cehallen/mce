class Movie < ActiveRecord::Base
  has_many :sentences
end
