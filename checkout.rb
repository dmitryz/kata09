require_relative('cart')
require_relative('item')
require_relative('price_calculator')
require_relative('price_rules/normal')
require_relative('price_rules/discount')

RULES = { 'A' => PriceRules::Discount.new(price: 50, discount_on: 3, discount_price: 130),
          'B' => PriceRules::Discount.new(price: 30, discount_on: 2, discount_price: 45),
          'C' => PriceRules::Normal.new(price: 20),
          'D' => PriceRules::Normal.new(price: 15)
        }.freeze

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
