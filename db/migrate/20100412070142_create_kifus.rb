class CreateKifus < ActiveRecord::Migration
  def self.up
    create_table :kifus do |t|
      t.integer :blackid
      t.integer :whiteid
      t.text :contents

      t.timestamps
    end
  end

  def self.down
    drop_table :kifus
  end
end
