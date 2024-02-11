# frozen_string_literal: true

require_relative '../../rules/base'

RSpec.describe Rules::Base do
  let(:base_rule) { described_class.new(name: 'Product', price: 10.0, quantity: 2) }

  it 'raises NotImplementedError for calculate_discount' do
    expect { base_rule.calculate_discount }.to raise_error(NotImplementedError)
  end
end
