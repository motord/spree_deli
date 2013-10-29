module Spree
  class Tower < ActiveRecord::Base
    has_many :stores, :through => :tower_stores
  end
end
