# frozen_string_literal: true

require_relative '../../rules/buy_one_get_one_free'

RSpec.describe Rules::BuyOneGetOneFree do
  let(:buy_one_get_one_free) { described_class.new(name: 'Green Tea', price: 3.11, quantity: 2) }

  it 'calculates discount correctly' do
    expect(buy_one_get_one_free.calculate_discount).to eq(3.11)
  end
end
