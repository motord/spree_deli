class CreateSpreeTowers < ActiveRecord::Migration
  def self.up
    create_table :spree_towers do |t|
      t.string :building
      t.timestamps
    end

    create_table :spree_towers_stores, :id => false do |t|
      t.references :tower
      t.references :store
      t.timestamps
    end

  end

  def self.down
    drop_table :spree_towers
    drop_table :spree_towers_stores
  end
end
