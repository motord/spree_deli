class AddTowerToSpreeAddresses < ActiveRecord::Migration
  def self.up
    add_column :spree_addresses, :tower, :integer
  end

  def self.down
    remove_column :spree_addresses, :tower
  end
end
