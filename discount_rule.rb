# frozen_string_literal: true

class DiscountRule
  attr_reader :rules

  def initialize(rules)
    @rules = rules
  end
end
