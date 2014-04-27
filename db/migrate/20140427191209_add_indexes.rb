class AddIndexes < ActiveRecord::Migration
  def change
    add_index :sentences, :movie_id 
    add_index :sjoinws, :sentence_id
    add_index :sjoinws, :word_id
  end
end
