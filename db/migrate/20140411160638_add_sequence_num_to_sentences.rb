class AddSequenceNumToSentences < ActiveRecord::Migration
  def change
    add_column :sentences, :number, :integer, null: false
  end
end
