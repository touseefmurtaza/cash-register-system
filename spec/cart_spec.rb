# frozen_string_literal: true

require_relative '../cart'
require_relative '../product'

RSpec.describe Cart do
  let(:cart) { described_class.new }
  let(:green_tea) { Product.new(sku: 'GR1', name: 'Green Tea', price: 3.11) }
  let(:strawberries) { Product.new(sku: 'SR1', name: 'Strawberries', price: 5.00) }
  let(:coffee) { Product.new(sku: 'CF1', name: 'Coffee', price: 11.23) }

  it 'adds a product to the cart' do
    cart.add_product(green_tea)
    expect(cart.all_products).to include(green_tea)
  end

  it 'organizes products with quantities correctly' do
    3.times { cart.add_product(strawberries) }
    2.times { cart.add_product(green_tea) }

    organized_cart = cart.products_with_quantities

    expect(organized_cart['SR1'][:quantity]).to eq(3)
    expect(organized_cart['GR1'][:quantity]).to eq(2)
  end
end
