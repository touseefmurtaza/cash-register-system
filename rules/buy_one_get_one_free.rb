# frozen_string_literal: true

module Rules
  class BuyOneGetOneFree < Base
    MINIMUM_PURCHASED_QUANTITY = 1

    def calculate_discount
      calculated_price = if quantity > MINIMUM_PURCHASED_QUANTITY
                           (quantity / 2.0).ceil * price
                         else
                           price
                         end
      calculated_price.to_f
    end
  end
end
