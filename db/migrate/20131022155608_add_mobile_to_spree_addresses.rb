class AddMobileToSpreeAddresses < ActiveRecord::Migration
  def self.up
    add_column :spree_addresses, :mobile, :string
  end

  def self.down
    remove_column :spree_addresses, :mobile
  end
end
