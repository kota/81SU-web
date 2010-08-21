class RemoveCountryFromPlayer < ActiveRecord::Migration
  def self.up
    remove_column :players, :country
  end

  def self.down
    add_column :players, :country, :string
  end
end
