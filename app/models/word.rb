class Word < ActiveRecord::Base
  validates :content, presence: true
  has_many :sentences, through: :s_join_ws
end
