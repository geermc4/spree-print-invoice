Spree::OrdersController.class_eval do
  append_before_filter :load_order, :only => [:print]
  def print
    @hide_prices = params[:template] == "packaging_slip"
    render :pdf, :layout => 'spree/layouts/pdfkit', :template => "spree/admin/orders/#{params[:template] || "invoice"}.html.erb"
  end
  def load_order
    @order = Spree::Order.find_by_number!(params[:id], :include => :adjustments) if params[:id]
    #authorize! action, @order
  end
end