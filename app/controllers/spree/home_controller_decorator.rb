module Spree
  HomeController.class_eval do

    def index
      today
      render(:action=> 'today')
    end

    private

    def trading_hours?( timestamp )
      (Spree::Config[:open_hour]...Spree::Config[:close_hour]).include?(timestamp.strftime("%H:%M"))
    end

    def today
      Time.zone=Spree::Config[:timezone]
      @now=Time.current.in_time_zone
      swap=check_swap(@now)
      if swap.nil?
        @today = @now.strftime('%A').downcase
      else
        @today=swap.swap
      end
      @trading_hours=trading_hours?(@now)
      @closed="抱歉，目前尚未到开餐时间(#{Spree::Config[:open_hour]} - #{Spree::Config[:close_hour]})。"

    end

    def check_swap(timestamp)
      Swap.where(original: (Time.now.midnight..(Time.now.midnight +  1.day))).take
    end

    def holiday


    end

  end
end