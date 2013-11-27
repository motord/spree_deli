module Spree
  AppConfiguration.class_eval do
    preference :open_hour, :string
    preference :close_hour, :string
    preference :timezone, :string
    preference :delivery_open_hour, :string
    preference :delivery_close_hour, :string
  end
end
