#Deface::Override.new(:virtual_path => "spree/admin/orders/show",
#                     :name => "print_buttons_pdf",
#                     :insert_bottom => "[data-hook='admin_order_show_details'], #admin_order_show_buttons[data-hook]",
#                     :partial => "spree/admin/orders/print_buttons",
#                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/orders/show",
                     :name => "admin_order_show_print_buttons",
                     :insert_bottom => "[data-hook='admin_order_show_details'], #admin_order_show_buttons[data-hook]",
                     :partial => "spree/admin/orders/print_buttons",
                     :disabled => false)
#Deface::Override.new(:virtual_path => "spree/admin/orders/edit",
#                     :name => "admin_order_edit_print_buttons",
#                     :insert_before => "[data-hook='admin_order_form_buttons']",
#                     :partial => "spree/admin/orders/print_buttons",
#                     :disabled => false)
