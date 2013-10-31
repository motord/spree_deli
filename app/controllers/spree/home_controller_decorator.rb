module Spree
  HomeController.class_eval do

    def index
      today
      render(:action=> 'today')
    end

    private

    def trading_hours?( date )
      ("10:00"..."16:00").include?(date.strftime("%H:%M"))
    end

    def today
      Time.zone='Beijing'
      @now=Time.current.in_time_zone
      @today = @now.strftime('%A').downcase
      @trading_hours=trading_hours?(@now)
      @closed='抱歉，目前尚未到开餐时间。'

    end

  end
end