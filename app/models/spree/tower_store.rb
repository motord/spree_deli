module Spree
  class TowerStore < ActiveRecord::Base
    belongs_to :store,  class_name: 'Spree::Store'
    belongs_to :tower, class_name: 'Spree::Tower'
  end
end
