module Spree
  Shipment.class_eval do
    def unstock
      manifest.each { |item| manifest_unstock(item) }
    end
  end
end