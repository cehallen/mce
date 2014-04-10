class CreateSJoinWs < ActiveRecord::Migration
  def change
    create_table :s_join_ws do |t|
      t.integer :sentence_id
      t.integer :word_id

      t.timestamps
    end
  end
end
