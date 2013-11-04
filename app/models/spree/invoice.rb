module Spree
  class Invoice
    include ActiveModel::Validations
    extend ActiveModel::Naming

    attr_accessor :order, :shipment, :errors, :opts
    attr_reader   :errors

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
        self.order.line_items
      else
        self.shipment.line_items
      end
    end

    def adjustments
      if self.shipment.nil?
        self.order.adjustments
      else
        (self.shipment.adjustment.nil?) ? [] : [self.shipment.adjustment]
      end
    end

    def adjustments_total
      self.adjustments.collect(&:amount).compact.sum unless self.adjustments.empty?
    end

    def total
      if self.shipment.nil?
        self.order.total
      else
        (self.subtotal + (self.adjustments_total || 0))
      end
    end

    def subtotal
      if self.shipment.nil?
        self.order.item_total
      else
        self.items.collect{|l| l.price * l.quantity }.sum
      end
    end

    private

    def has_order?
      !self.order.nil?
    end

    def has_shipment?
      !self.order.nil? && !self.opts[:shipment_id].nil?
    end

  end
end
