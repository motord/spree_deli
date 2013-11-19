module Spree
  module Admin
    class SwapsController < ResourceController

      before_filter :load_data, :except => :index

      protected

      def load_data
        @swap_options = ['sunday', 'monday', 'tuesday','wednesday','thursday', 'friday', 'saturday', 'holiday']
      end

    end
  end
end
