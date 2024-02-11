# frozen_string_literal: true

require_relative '../rules/base'
require_relative '../rules/buy_one_get_one_free'
require_relative '../rules/three_or_more_items_purchased/overridden_price'
require_relative '../rules/three_or_more_items_purchased/price_drop_by'
require_relative '../cart'
require_relative '../product'
require_relative '../discount_rule'
require_relative '../cash_register'

# rubocop:disable Metrics/BlockLength
RSpec.describe CashRegister do
  let(:rules) do
    [
      { 'rule_name' => 'buy_one_get_one_free', 'applicable_products' => ['GR1'],
        'calculator' => 'Rules::BuyOneGetOneFree' },
      { 'rule_name' => 'override_price_with_three_or_more_items_purchased', 'applicable_products' => ['SR1'],
        'calculator' => 'Rules::ThreeOrMoreItemsPurchased::OverriddenPrice', 'overridden_price' => '4.50' },
      { 'rule_name' => 'price_droped_by_with_three_or_more_items_purchased', 'applicable_products' => ['CF1'],
        'calculator' => 'Rules::ThreeOrMoreItemsPurchased::PriceDropBy', 'price_droped_by' => '0.6667' }
    ]
  end

  let(:cash_register) { CashRegister.new(rules) }

  describe '#calculate_final_price' do
    it 'calculates final price correctly with buy one get one free rule' do
      products = [Product.new(sku: 'GR1', name: 'Green Tea', price: 3.11),
                  Product.new(sku: 'GR1', name: 'Green Tea', price: 3.11)]
      expect(cash_register.calculate_final_price(products)).to eq(3.11)
    end

    it 'calculates final price correctly with overridden price rule' do
      products = [
        Product.new(sku: 'SR1', name: 'Strawberries', price: 5.00),
        Product.new(sku: 'SR1', name: 'Strawberries', price: 5.00),
        Product.new(sku: 'SR1', name: 'Strawberries', price: 5.00)
      ]
      expect(cash_register.calculate_final_price(products)).to eq(13.50)
    end

    it 'calculates final price correctly with price drop by rule' do
      products = [
        Product.new(sku: 'CF1', name: 'Coffee', price: 11.23),
        Product.new(sku: 'CF1', name: 'Coffee', price: 11.23),
        Product.new(sku: 'CF1', name: 'Coffee', price: 11.23)
      ]
      expect(cash_register.calculate_final_price(products)).to eq(22.46)
    end

    it 'calculates final price correctly with a combination of rules' do
      products = [
        Product.new(sku: 'GR1', name: 'Green Tea', price: 3.11),
        Product.new(sku: 'SR1', name: 'Strawberries', price: 5.00),
        Product.new(sku: 'CF1', name: 'Coffee', price: 11.23),
        Product.new(sku: 'CF1', name: 'Coffee', price: 11.23),
        Product.new(sku: 'CF1', name: 'Coffee', price: 11.23)
      ]
      expect(cash_register.calculate_final_price(products)).to eq(30.57)
    end
  end
end
# rubocop:enable Metrics/BlockLength
