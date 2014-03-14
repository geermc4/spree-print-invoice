module Spree
  module Admin
    class InvoicesController < BaseController
      layout "spree/layouts/invoice"

      def show
        # show all invoices in a list
      end

      def print
        render :html, :template => "spree/admin/invoices/invoice.html.erb"
      end

      protected

      def authorize_admin
        load_objects
        authorize! :read, @order, session[:access_token]
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