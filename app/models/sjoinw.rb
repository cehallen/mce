class Sjoinw < ActiveRecord::Base
  belongs_to :word, dependent: :destroy
  belongs_to :sentence
end
