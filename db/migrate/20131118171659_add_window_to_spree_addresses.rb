class AddWindowToSpreeAddresses < ActiveRecord::Migration
  def self.up
    add_column :spree_addresses, :window, :integer
  end

  def self.down
    remove_column :spree_addresses, :window
  end
end
