class RemoveScriptFromMovies < ActiveRecord::Migration
  def up
    remove_column :movies, :script
  end

  def down
    add_column :movies, :script, :text
  end
end
