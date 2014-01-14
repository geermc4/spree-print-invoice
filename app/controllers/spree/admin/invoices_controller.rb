module Spree
  module Admin
    class InvoicesController < ResourceController
      layout "spree/layouts/invoice"
      before_filter :load_objects, :only => [:print]

      def show
        # show all invoices in a list
      end

      def print
        render :html, :template => "spree/admin/invoices/invoice.html.erb"
      end
      
      private

      def load_objects
        @invoice = Spree::Invoice.new(params)
        if !@invoice.valid?
          redirect_to admin_orders_path
        end
        @order = @invoice.order
      end
    end
  end
end