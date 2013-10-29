class AddMobileToSpreeUsers < ActiveRecord::Migration
  def self.up
    add_column :spree_users, :mobile, :string
  end

  def self.down
    remove_column :spree_users, :mobile
  end
end
