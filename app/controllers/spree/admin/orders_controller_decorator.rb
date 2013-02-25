Spree::Admin::OrdersController.class_eval do
  def print
    @hide_prices = params[:template] == "packaging_slip"
    render :template => "admin/orders/#{params[:template] || "invoice"}.html.erb", :layout => 'pdfkit'
  end
end