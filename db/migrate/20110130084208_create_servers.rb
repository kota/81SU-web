class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :name
      t.string :description
      t.integer :population
      t.datetime :started_at
      t.datetime :updated_at
      t.datetime :maintenance_at

      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
