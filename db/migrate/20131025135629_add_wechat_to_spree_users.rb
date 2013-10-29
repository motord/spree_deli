class AddWechatToSpreeUsers < ActiveRecord::Migration
  def self.up
    add_column :spree_users, :wechat, :string
  end

  def self.down
    remove_column :spree_users, :wechat
  end
end
