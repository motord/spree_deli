module Spree
  Store.class_eval do
    has_many :towers, :through => :tower_stores
  end
end