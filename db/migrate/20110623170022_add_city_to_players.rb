class AddCityToPlayers < ActiveRecord::Migration
  def self.up
    add_column :players, :city_name, :string
    add_column :players, :city_lat, :float
    add_column :players, :city_lon, :float
  end

  def self.down
    remove_column :players, :city_name
    remove_column :players, :city_lat
    remove_column :players, :city_lon
  end
end
