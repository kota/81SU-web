class AddAuthTokenToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :auth_token, :string
  end

  def self.down
    remove_column :players, :auth_token
  end
end
