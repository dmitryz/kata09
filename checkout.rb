# frozen_string_literal: true

require_relative('cart')
require_relative('item')
require_relative('calculators/price')
require_relative('price_rules/schema')

RULES = PriceRules::Schema.build do
  discount sku: 'A', amount: 50, discount_on: 3, discount_price: 130
  discount sku: 'B', amount: 30, discount_on: 2, discount_price: 45
  normal sku: 'C', amount: 20
  normal sku: 'D', amount: 15
end

class CheckOut
  def initialize(rules)
    @cart = Cart.new
    @rules = rules
  end

  def scan(sku)
    cart.scan(sku)
  end

  def total
    cart.process(rules, Calculators::Price).inject(0, :+)
  end

  private

  attr_reader :cart, :rules
end
