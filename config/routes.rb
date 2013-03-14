#Spree::Core::Engine.routes.draw do
Rails.application.routes.draw do
  match "/admin/orders/:id/print", :to => 'spree/admin/orders#print', :via => :get, :as => :spree_admin_print_order
  match "/orders/:id/print", :to => 'spree/orders#print', :via => :get, :as => :spree_admin_print_order
end
