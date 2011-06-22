class ChangeRateTypeToFloat < ActiveRecord::Migration
  def self.up
    change_column :players, :rate, :float
  end

  def self.down
    change_column :players, :rate, :integer
  end
end
