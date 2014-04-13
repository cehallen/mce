class Word < ActiveRecord::Base
  validates :content, presence: true
  has_many :sjoinws
  has_many :sentences, through: :sjoinws
  has_many :movies, through: :sentences, uniq: true
end
