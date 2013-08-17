Deface::Override.new(:virtual_path    => "spree/admin/orders/_shipment",
                     :name            => "add_invoice_to_shipment_edit",
                     :insert_after    => "[data-hook='stock-location']",
                     :partial         => "spree/admin/invoices/print_buttons")

Deface::Override.new(:virtual_path => "spree/admin/orders/edit",
                     :name => "admin_order_show_print_buttons",
                     :insert_after => "[data-hook='admin_order_edit_form']",
                     :partial => "spree/orders/print_invoice_admin_orders",
                     :disabled => false)