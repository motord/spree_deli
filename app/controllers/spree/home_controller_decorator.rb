module Spree
  HomeController.class_eval do

    def index
      today
      render(:action=> 'today')
    end

    private

    def trading_hours?( timestamp )
      (Spree::Config[:open_hour]..Spree::Config[:close_hour]).include?(timestamp.strftime("%H:%M"))
    end

    def today
      Time.zone=Spree::Config[:timezone]
      @now=Time.current.in_time_zone
      @swap=swap?(@now)
      @trading_hours=trading_hours?(@now)
    end

    def swap?(timestamp)
      debugger
      swap=Swap.where(original: (timestamp.midnight..(timestamp.midnight +  1.day))).take
      if swap.nil?
        @today = timestamp.strftime('%A').downcase
        return false
      else
        @today=swap.swap
        @notice=swap.notice
        return true
      end

    end

    def holiday


    end

  end
end