# frozen_string_literal: true

require_relative '../../../rules/three_or_more_items_purchased/price_drop_by'

RSpec.describe Rules::ThreeOrMoreItemsPurchased::PriceDropBy do
  let(:price_drop_by) { described_class.new(name: 'Coffee', price: 11.23, quantity: 3, price_droped_by: 0.6667) }

  it 'calculates discount correctly' do
    expect(price_drop_by.calculate_discount).to eq(22.46)
  end
end
