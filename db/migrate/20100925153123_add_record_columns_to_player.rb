class AddRecordColumnsToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :wins, :integer, :default => 0
    add_column :players, :losses, :integer, :default => 0
    add_column :players, :streak, :integer, :default => 0
    add_column :players, :streak_best, :integer, :default => 0
  end

  def self.down
    remove_column :players, :streak_best
    remove_column :players, :streak
    remove_column :players, :losses
    remove_column :players, :wins
  end
end
