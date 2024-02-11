# frozen_string_literal: true

module Rules
  class Base
    attr_accessor :name,
                  :price,
                  :quantity,
                  :overridden_price,
                  :price_droped_by

    def initialize(name: nil, price: nil, quantity: nil, overridden_price: nil, price_droped_by: nil)
      @name = name
      @price = price.to_f
      @quantity = quantity.to_f
      @overridden_price = overridden_price.to_f
      @price_droped_by = price_droped_by.to_f
    end

    def calculate_discount
      raise NotImplementedError, "#{self.class} must implement 'calculate_discount' method."
    end
  end
end
