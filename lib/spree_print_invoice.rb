require 'spree_print_invoice/engine'
require 'pdfkit'

module Spree
  module PrintInvoice
    def self.config(&block)
      yield(Spree:PrintInvoice::Config)
    end
  end
end

#Mime::Type.register 'application/pdf', :pdf
