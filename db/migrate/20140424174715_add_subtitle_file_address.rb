class AddSubtitleFileAddress < ActiveRecord::Migration
  def change
    add_column :movies, :subtitle_file_url, :string
  end
end
