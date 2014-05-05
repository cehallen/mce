class AddColumnUserToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :user_id, :integer, null: false
  end
end
