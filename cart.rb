# frozen_string_literal: true

class Cart
  attr_accessor :all_products

  def initialize
    @all_products = []
  end

  def add_product(product)
    @all_products << product
  end

  def products_with_quantities
    product_hash = Hash.new { |hash, key| hash[key] = { sku: key, name: nil, price: nil, quantity: 0 } }
    all_products.each do |product|
      sku = product.sku
      product_hash[sku][:name] = product.name
      product_hash[sku][:price] = product.price
      product_hash[sku][:quantity] += 1
    end

    product_hash
  end
end
