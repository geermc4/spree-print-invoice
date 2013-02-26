Deface::Override.new(:virtual_path  => "spree/orders/show",
                     :name          => "add_print_label_to_customer_order",
                     :insert_bottom => "p[ data-hook='links' ]",
                     :partial       => "spree/orders/print_invoice_account_page")
