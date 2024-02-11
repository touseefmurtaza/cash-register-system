# frozen_string_literal: true

require_relative '../discount_rule'

RSpec.describe DiscountRule do
  let(:rules) do
    [
      { rule_name: 'buy_one_get_one_free', applicable_products: ['GR1'], calculator: 'Rules::BuyOneGetOneFree' },
      { rule_name: 'override_price_with_three_or_more_items_purchased', applicable_products: ['SR1'],
        calculator: 'Rules::ThreeOrMoreItemsPurchased::OverriddenPrice', overridden_price: '4.50' },
      { rule_name: 'price_droped_by_with_three_or_more_items_purchased', applicable_products: ['CF1'],
        calculator: 'Rules::ThreeOrMoreItemsPurchased::PriceDropBy', price_droped_by: '0.6667' }
    ]
  end

  let(:discount_rule) { described_class.new(rules) }

  it 'loads rules correctly' do
    expect(discount_rule.rules).to eq(rules)
  end
end
