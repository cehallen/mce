class AddNullfalseJoinTable < ActiveRecord::Migration
  def up
    change_column :s_join_ws, :sentence_id, :integer, null: false
    change_column :s_join_ws, :word_id, :integer, null: false
  end

  def down
    change_column :s_join_ws, :sentence_id, :integer
    change_column :s_join_ws, :word_id, :integer
  end
end
