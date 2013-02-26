Spree::Admin::OrdersController.class_eval do
  def print
    load_order
    @hide_prices = params[:template] == "packaging_slip"
    #respond_with(@order)
    render :layout => 'spree/layouts/pdfkit', :template => "spree/admin/orders/#{params[:template] || "invoice"}.html.erb", :locals => { :order => @order }
  end
end