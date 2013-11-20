module Spree
  module Admin
    class ShelvesController < Spree::Admin::BaseController

      def update
        if params[:smtp_password].blank?
          params.delete(:smtp_password)
        end

        render :edit
      end

      def edit
        method_name = "#{params[:id]}"
        products=Spree::Product.send(method_name) if Spree::Product.respond_to? method_name
        @variants=products.map {|p|p.master}
        @stock_locations = StockLocation.accessible_by(current_ability, :read)
        if @stock_locations.empty?
          flash[:error] = Spree.t(:stock_management_requires_a_stock_location)
          redirect_to admin_stock_locations_path
        end
      end

    end
  end
end

