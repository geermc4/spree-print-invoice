Spree::Admin::OrdersController.class_eval do
  def print
    load_order
    @hide_prices = params[:template] == "packaging_slip"
    render :layout => 'spree/layouts/pdfkit', :template => "spree/admin/orders/#{params[:template] || "invoice"}.html.erb"
  end
end