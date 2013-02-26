SUMMARY
=======

This extension provides a "Print Invoice" button on the Admin Orders view screen which generates a PDF of the order details.

**NOTE:** Master branch should work with Spree 0.60.x + Deface

 
INSTALLATION
============

1. The gem relies only on the prawn gem, to install you need to add the following lines to your Gemfile

    gem 'spree_print_invoice' , :git => 'git://github.com/mrpollo/spree-print-invoice.git'

2. run bundler

    bundle install

3. Install [wkhtmltopdf](https://github.com/pdfkit/pdfkit/wiki/Installing-WKHTMLTOPDF)
4. Add the following line to your application.rb

    config.middleware.use PDFKit::Middleware, {}, :only => %r[.*?/print]

5. Enjoy!

Configuration
==============

1. Set the logo path preference to include your store / company logo.

    Spree::Config.set(:print_invoice_logo_path => "/company-logo.png")

2. Override any of the partial templates. 

3. Set :suppress_anonymous_address option to get blank addresses for anonymous email addresses (as created by my spree_last_address extension for empty/unknown user info)

4. Enable packaging slips, by setting 

  Spree::Config.set(:print_buttons => "invoice,packaging_slip"  #comma separated list

 Use above feature for your own template if you want. For each button_name, define button_name_print text in your locale.


