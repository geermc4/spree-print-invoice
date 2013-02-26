Deface::Override.new(:virtual_path => "spree/admin/orders/show",
                     :name => "admin_order_show_print_buttons",
                     :insert_bottom => "[data-hook='admin_order_show_details'], #admin_order_show_buttons[data-hook]",
                     :partial => "spree/orders/print_invoice_account_page",
                     :disabled => false)
Deface::Override.new(:virtual_path => "spree/admin/orders/edit",
                     :name => "admin_order_edit_print_buttons",
                     :insert_before => "[data-hook='admin_order_form_buttons']",
                     :partial => "spree/orders/print_invoice_account_page",
                     :disabled => false)
