module Spree
  OrdersController.class_eval do

    skip_before_action :verify_authenticity_token, :only=> [:populate_simplecart]

    # Adds a new item to the order (creating a new order if none already exists)
    def populate_simplecart
      populator = Spree::OrderPopulator.new(current_order(true), current_currency)
      (1..32).each do |i|
        copy_params = params.dup
        p = copy_params.slice(:"item_quantity_#{i}", :"item_options_#{i}")
        if p.empty?

        else
          value= p[:"item_options_#{i}"]
          value=~ /pid: product_([0-9]+)/
          product_id=$1.to_i
          product=Product.find(product_id)
          variant=product.master
          p={:products=>{product_id=>variant.id}, :quantity=>p[:"item_quantity_#{i}"]}
          if populator.populate(p.slice(:products, :variants, :quantity))
            current_order.ensure_updated_shipments

            fire_event('spree.cart.add')
            fire_event('spree.order.contents_changed')
          else
            flash[:error] = populator.errors.full_messages.join(" ")
            redirect_to :back
          end
        end
      end
      respond_with(@order) do |format|
        format.html { redirect_to checkout_path }
      end
    end

  end
end