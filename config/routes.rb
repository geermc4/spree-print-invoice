Spree::Core::Engine.routes.draw do
  Spree::Core::Engine.routes.draw do
    resources :orders do
      get :print
      match "/print" => "orders#print", :as => :print_user_invoice
    end
    namespace :admin do
      resources :orders do
        get :print
        match "/print" => "orders#print", :as => :print_admin_invoice
      end
    end
  end
end

