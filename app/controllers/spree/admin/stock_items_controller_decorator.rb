module Spree
  module Admin
    StockItemsController.class_eval do
      before_filter :determine_count_on_hand, only: :update  
      
      def update
        stock_item.save
        respond_to do |format|
          format.js { head :ok }
          format.json { respond_with_bip(stock_item) }
        end
      end

      private
      def determine_count_on_hand
        stock_item.set_count_on_hand(params[:stock_item][:count_on_hand]) if params[:stock_item].present? && params[:stock_item][:count_on_hand].present?
      end
    end
  end
end
