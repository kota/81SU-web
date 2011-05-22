class CreateRateChangeHistories < ActiveRecord::Migration
  def self.up
    create_table :rate_change_histories do |t|
      t.integer :player_id
      t.integer :change
      t.timestamps
    end
  end

  def self.down
    drop_table :rate_change_histories
  end
end
