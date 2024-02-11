# frozen_string_literal: true

module Rules
  module ThreeOrMoreItemsPurchased
    class OverriddenPrice < ::Rules::Base
      MINIMUM_PURCHASED_QUANTITY = 3

      def calculate_discount
        calculated_price = if quantity >= MINIMUM_PURCHASED_QUANTITY
                             overridden_price.positive? ? overridden_price : price
                           else
                             price
                           end
        calculated_price *= quantity
        calculated_price.to_f
      end
    end
  end
end
