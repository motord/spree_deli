class AddTowerToSpreeAddresses < ActiveRecord::Migration
  def self.up
    add_column :spree_addresses, :tower_id, :integer
  end

  def self.down
    remove_column :spree_addresses, :tower_id
  end
end
