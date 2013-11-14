Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  get "/today" => "home#today"
  post "/orders/populate_simplecart" => "orders#populate_simplecart"
end
