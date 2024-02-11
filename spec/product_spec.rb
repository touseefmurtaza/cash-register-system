# frozen_string_literal: true

require_relative '../product'

RSpec.describe Product do
  let(:product) { described_class.new(sku: 'GR1', name: 'Green Tea', price: 3.11) }

  it 'has attributes set correctly' do
    expect(product.sku).to eq('GR1')
    expect(product.name).to eq('Green Tea')
    expect(product.price).to eq(3.11)
  end
end
