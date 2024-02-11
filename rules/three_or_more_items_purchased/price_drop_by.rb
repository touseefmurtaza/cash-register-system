# frozen_string_literal: true

module Rules
  module ThreeOrMoreItemsPurchased
    class PriceDropBy < ::Rules::Base
      MINIMUM_PURCHASED_QUANTITY = 3

      def calculate_discount
        calculated_price = if quantity >= MINIMUM_PURCHASED_QUANTITY
                             price_droped_by.positive? ? price * price_droped_by : price
                           else
                             price
                           end
        calculated_price *= quantity
        calculated_price.round(2).to_f
      end
    end
  end
end
