class Word < ActiveRecord::Base
  validates :content, presence: true
  has_many :sentences, through: :sjoinws
  has_many :sjoinws
end
