module Spree
  module Admin
    class SwapsController < ResourceController
      before_filter :load_data
      before_filter :load_event_names

      helper 'spree/promotion_rules'

      protected
      def location_after_save
        spree.edit_admin_promotion_url(@promotion)
      end

      def load_data
        @calculators = Rails.application.config.spree.calculators.promotion_actions_create_adjustments
      end

      def load_event_names
        @event_names = Spree::Activator.event_names.map { |name| [Spree.t("events.#{name}"), name] }
      end

      def index
        #session[:return_to] = request.url
        #respond_with(@collection)
      end

    end
  end
end
