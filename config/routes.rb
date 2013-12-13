Spree::Core::Engine.append_routes do
  scope module: :admin do
    resources :orders, :only => [] do
      get "/invoice" => "invoices#print"
    end
  end
  namespace :admin do
    resources :orders, :only => [] do
      get "/invoices" => "invoices#show"
      get "/invoices/complete" => "invoices#print"
      get "/invoices/shipments/:shipment_id" => "invoices#print", :as => "invoices_shipments"
    end
  end
end
