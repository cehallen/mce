class ChangeSJoinWTableName < ActiveRecord::Migration
  def up
    rename_table :s_join_ws, :sjoinws
  end

  def down
    rename_table :sjoinws, :s_join_ws
  end 
end
