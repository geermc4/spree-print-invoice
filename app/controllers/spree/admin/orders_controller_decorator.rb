Spree::Admin::OrdersController.class_eval do
  def print
    load_order
    @hide_prices = params[:template] == "packaging_slip"
    render :pdf, :layout => 'spree/layouts/pdfkit', :template => "spree/admin/orders/#{params[:template] || "invoice"}.html.erb"
  end
end
