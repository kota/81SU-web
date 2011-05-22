class AddColumnsToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :show_ranking, :boolean, :default => true
    add_column :players, :max_rate, :integer, :default => 1000
    add_column :players, :wins34, :integer, :default => 0
    add_column :players, :losses34, :integer, :default => 0
    add_column :players, :latest_ip_address, :string
    add_column :players, :avatar_image_url, :string
    add_column :players, :pr, :text
  end

  def self.down
    remove_column :players, :show_ranking
    remove_column :players, :max_rate
    remove_column :players, :wins34
    remove_column :players, :losses34
    remove_column :players, :latest_ip_address
    remove_column :players, :avatar_image_url
    remove_column :players, :pr
  end
end
