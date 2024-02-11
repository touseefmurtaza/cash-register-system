# frozen_string_literal: true

class Product
  attr_reader :sku, :name, :price

  def initialize(sku:, name:, price:)
    @sku = sku.to_s.upcase
    @name = name.to_s
    @price = price
  end
end
