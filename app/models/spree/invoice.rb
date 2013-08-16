module Spree
  class Invoice
    include ActiveModel::Validations
    
    attr_accessor :order, :shipment, :errors, :opts
    validates_presence_of :order
    validates_presence_of :shipment, :if => :has_shipment?

    def initialize(opts = {})
      @errors = ActiveModel::Errors.new(self)
      self.opts = opts
      self.order = Spree::Order.find_by_number opts[:order_id]
      self.shipment = @order.shipments.select{|s| s.number == opts[:shipment_id]}.try(:first) unless opts[:shipment_id].nil?
    end
    
    def items
      if self.shipment.nil?
        # self.order.shipments.collect(&:line_item_manifest).flatten
        self.order.line_items
      else
        self.shipment.line_items
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
    
    def has_shipment?
      !self.opts[:shipment_id].nil?
    end

  end
end
