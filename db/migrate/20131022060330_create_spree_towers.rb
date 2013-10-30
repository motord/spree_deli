class CreateSpreeTowers < ActiveRecord::Migration
  def self.up
    create_table :spree_towers do |t|
      t.string :building
      t.timestamps
    end

  end

  def self.down
    drop_table :spree_towers
  end
end
