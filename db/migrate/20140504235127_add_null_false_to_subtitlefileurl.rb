class AddNullFalseToSubtitlefileurl < ActiveRecord::Migration
  def up
    change_column :movies, :subtitle_file_url, :string, null: false
  end

  def down
    change_column :movies, :subtitle_file_url, :string
  end
end
