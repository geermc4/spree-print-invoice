module Spree
  class Invoice
    include ActiveModel::Validations
    extend ActiveModel::Naming
    
    attr_accessor :order, :shipment, :errors, :opts
    attr_reader   :errors

    validate :has_valid_members?

    def initialize(opts = {})
      @errors = ActiveModel::Errors.new(self)
      self.opts = opts
      self.order = Spree::Order.find_by_number opts[:order_id]
      if !self.order.nil?
        self.shipment = @order.shipments.select{|s| s.number == opts[:shipment_id]}.try(:first) unless opts[:shipment_id].nil?
      end
    end
    
    def items
      if self.shipment.nil?
        self.order.shipments.collect(&:manifest).flatten
      else
        self.shipment.manifest
      end
    end
    
    def adjustments
      if self.shipment.nil?
        self.order.adjustments
      else
        [self.shipment.adjustment]
      end
    end
    
    def total
      if self.shipment.nil?
        self.order.total
      else
        (self.shipment.line_items.collect(&:price).reduce(:+) + self.adjustments.collect(&:amount).reduce(:+)).to_f
      end
    end
    
    def subtotal
      if self.shipment.nil?
        self.order.item_total
      else
        self.shipment.line_items.collect(&:price).reduce(:+)
      end
    end
    
    private
    
    def has_valid_members?
      # self.order.errors.add(:order, Spree.t(:invalid_order)) unless has_order?
      # self.shipment.errors.add(:shipment, Spree.t(:invalid_shipment)) unless has_shipment?
    end
    
    def has_order?
      !self.order.nil?
    end
    
    def has_shipment?
      !self.order.nil? && !self.opts[:shipment_id].nil?
    end

  end
end
