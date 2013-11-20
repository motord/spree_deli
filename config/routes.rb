Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  get "/today" => "home#today"
  post "/orders/populate_simplecart" => "orders#populate_simplecart"

  namespace :admin do
    resources :shelves, :only => [:edit, :update] do
    end

    resource :trading_hours, :only => [:edit, :update] do
    end

    resources :swaps do
    end

    resources :towers do
    end

  end
end
