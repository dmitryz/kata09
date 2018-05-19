require_relative('cart')
require_relative('item')
require_relative('price_calculator')
require_relative('price_rules/schema')
require_relative('price_rules/normal')
require_relative('price_rules/discount')

RULES = PriceRules::Schema.build do
  discount_price sku: 'A', amount: 50, discount_on: 3, discount_price: 130
  discount_price sku: 'B', amount: 30, discount_on: 2, discount_price: 45
  price sku: 'C', amount: 20
  price sku: 'D', amount: 15
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
    cart.process(rules, PriceCalculator).inject(0, :+)
  end

  private

  attr_reader :cart, :rules
end
