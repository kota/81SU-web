class AddCountryIdToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :country_id, :int
  end

  def self.down
    remove_column :players, :country_id
  end
end
