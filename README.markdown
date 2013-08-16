SUMMARY
=======

This extension provides a "Print Invoice" button on the Admin Orders view screen which generates an html view of the order details.

After 2.0.0 version this extension now includes invoices for each shipment to allow for international shipments to include invoices for custom declarations, this version only supports Spree ~> 2.0.0

**NOTE:** Master branch should work with Spree 2.0.0, but look for your branch

 
INSTALLATION
============

1. To install you need to add the following lines to your Gemfile

    gem 'spree_print_invoice' , :git => 'git://github.com/mrpollo/spree-print-invoice.git'

2. run bundler

    bundle install

3. Enjoy!

Configuration
==============

1. Set the logo path preference to include your store / company logo.

    Spree::Config.set(:print_invoice_logo_path => "/company-logo.png")

2. Override any of the partial templates. 

3. Set :suppress_anonymous_address option to get blank addresses for anonymous email addresses (as created by my spree_last_address extension for empty/unknown user info)

4. If you are using ```spree_product_assembly``` and find any issues please let me know