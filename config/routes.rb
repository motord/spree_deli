Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  get "/today" => "home#today"
end
