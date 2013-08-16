require 'spree_print_invoice/engine'

module Spree
  module PrintInvoice
    def self.config(&block)
      yield(Spree:PrintInvoice::Config)
    end
  end
end