# frozen_string_literal: true

require_relative '../../../rules/three_or_more_items_purchased/overridden_price'

RSpec.describe Rules::ThreeOrMoreItemsPurchased::OverriddenPrice do
  let(:overridden_price) { described_class.new(name: 'Strawberries', price: 5.00, quantity: 3, overridden_price: 4.50) }

  it 'calculates discount correctly' do
    expect(overridden_price.calculate_discount).to eq(13.50)
  end
end
