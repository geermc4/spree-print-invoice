Spree::Admin::OrdersController.class_eval do
  append_before_filter :load_order, :only => [:print]
  def print
    @hide_prices = params[:template] == "packaging_slip"
    render :pdf, :layout => 'spree/layouts/pdfkit', :template => "spree/admin/orders/#{params[:template] || "invoice"}.html.erb"
  end
end