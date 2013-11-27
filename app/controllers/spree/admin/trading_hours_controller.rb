module Spree
  module Admin
    class TradingHoursController < Spree::Admin::BaseController

      def update
        if params[:timezone].blank?
          params.delete(:timezone)
        end

        if params[:open_hour].blank?
          params.delete(:open_hour)
        end

        if params[:close_hour].blank?
          params.delete(:close_hour)
        end

        if params[:delivery_open_hour].blank?
          params.delete(:delivery_open_hour)
        end

        if params[:delivery_close_hour].blank?
          params.delete(:delivery_close_hour)
        end

        params.each do |name, value|
          next unless Spree::Config.has_preference? name
          Spree::Config[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, :resource => Spree.t(:trading_hours))
        render :edit
      end

    end
  end
end