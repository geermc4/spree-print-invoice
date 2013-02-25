Spree::Admin::OrdersController.class_eval do
  def print
    load_order
    @hide_prices = params[:template] == "packaging_slip"
    render :template => "spree/admin/orders/#{params[:template] || "invoice"}.html.erb", :layout => 'spree/layouts/pdfkit'
  end
end