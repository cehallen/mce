class AddFrequencyToWord < ActiveRecord::Migration
  def change
    add_column :words, :frequency, :integer, default: 1
  end
end
