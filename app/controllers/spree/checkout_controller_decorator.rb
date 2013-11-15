module Spree
  CheckoutController.class_eval do

    def before_address
      @order.ship_address ||= Address.default
    end

  end
end