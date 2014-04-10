class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.integer :movie_id, null: false
      t.string :time_marker, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
