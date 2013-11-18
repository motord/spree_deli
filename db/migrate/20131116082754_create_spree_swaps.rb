class CreateSpreeSwaps < ActiveRecord::Migration
  def self.up
    create_table :spree_swaps do |t|
      t.date :original
      t.string :swap
      t.string :notice
    end

  end

  def self.down
    drop_table :spree_swaps
  end

end
