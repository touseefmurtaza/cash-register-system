# frozen_string_literal: true

# cash_register.rb
class CashRegister
  def initialize(rules)
    @rules = rules
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def calculate_final_price(products)
    organized_cart = organize_products(products)
    final_price = 0.0

    organized_cart.each_key do |product_sku|
      applicable_rules = @rules.select { |rule| rule['applicable_products'].include?(product_sku) }

      applicable_rules.each do |applicable_rule|
        product = organized_cart[product_sku]
        calculator = Object.const_get(applicable_rule['calculator']).new(
          name: product[:name],
          price: product[:price],
          quantity: product[:quantity],
          overridden_price: applicable_rule['overridden_price'],
          price_droped_by: applicable_rule['price_droped_by']
        )
        final_price += calculator.calculate_discount
      end
    end

    final_price.round(2)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  def organize_products(products)
    product_hash = Hash.new { |hash, key| hash[key] = { sku: key, name: nil, price: nil, quantity: 0 } }
    products.each do |product|
      sku = product.sku
      product_hash[sku][:name] = product.name
      product_hash[sku][:price] = product.price
      product_hash[sku][:quantity] += 1
    end

    product_hash
  end
end
