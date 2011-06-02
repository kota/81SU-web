class AddColumnsToRateChangeHistories < ActiveRecord::Migration
  def self.up
    add_column :rate_change_histories, :sente, :boolean
    add_column :rate_change_histories, :opening, :string
  end

  def self.down
    remove_column :rate_change_histories, :sente
    remove_column :rate_change_histories, :opening
  end
end
