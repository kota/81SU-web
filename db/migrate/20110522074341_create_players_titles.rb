class CreatePlayersTitles < ActiveRecord::Migration
  def self.up
    create_table :players_titles do |t|
      t.integer :player_id
      t.integer :title_id
      t.timestamps
    end
  end

  def self.down
    drop_table :players_titles
  end
end
