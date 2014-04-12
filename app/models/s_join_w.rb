class SJoinW < ActiveRecord::Base
  belongs_to :word
  belongs_to :sentence
end
