# frozen_string_literal: true

require 'yaml'
require_relative './rules/base'
require_relative './rules/buy_one_get_one_free'
require_relative './rules/three_or_more_items_purchased/overridden_price'
require_relative './rules/three_or_more_items_purchased/price_drop_by'
require_relative 'cart'
require_relative 'product'
require_relative 'discount_rule'
require_relative 'cash_register'

# Load rules
rules_file_path = 'rules.yml'
raise ArgumentError, "Rules file not found at #{rules_file_path}" unless File.exist?(rules_file_path)

rules = YAML.safe_load(File.read(rules_file_path))

# Products
green_tea = Product.new(sku: 'GR1', name: 'Green Tea', price: 3.11)
strawberries = Product.new(sku: 'SR1', name: 'Strawberries', price: 5.00)
coffee = Product.new(sku: 'CF1', name: 'Coffee', price: 11.23)

# Usecase 1
cash_register = CashRegister.new(rules)
cart_products = [green_tea, green_tea]
final_price = cash_register.calculate_final_price(cart_products)
puts "Final Price: #{final_price}€"

# Usecase 2
cash_register = CashRegister.new(rules)
cart_products = [strawberries, strawberries, green_tea, strawberries]
final_price = cash_register.calculate_final_price(cart_products)
puts "Final Price: #{final_price}€"

# Usecase 3
cash_register = CashRegister.new(rules)
cart_products = [green_tea, strawberries, coffee, coffee, coffee]
final_price = cash_register.calculate_final_price(cart_products)
puts "Final Price: #{final_price}€"
