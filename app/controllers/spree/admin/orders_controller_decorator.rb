Spree::Admin::OrdersController.class_eval do
  def print
    @hide_prices = params[:template] == "packaging_slip"
    @order = Spree::Order.find_by_number!(params[:order_id], :include => :adjustments) if params[:order_id]
    render :pdf, :layout => 'spree/layouts/pdfkit', :template => "spree/admin/orders/#{params[:template] || "invoice"}.html.erb"
  end
end
