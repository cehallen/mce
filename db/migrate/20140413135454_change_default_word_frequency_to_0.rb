class ChangeDefaultWordFrequencyTo0 < ActiveRecord::Migration
  def up
    change_column :words, :frequency, :integer, default: 0
  end

  def down
    change_column :words, :frequency, :integer, default: 1
  end
end
