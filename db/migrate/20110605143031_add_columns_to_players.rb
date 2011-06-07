class AddColumnsToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :draws34, :integer, :default => 0
    add_column :players, :exp34, :integer, :default => 0
  end

  def self.down
    remove_column :players, :draws34
    remove_column :players, :exp34
  end
end
