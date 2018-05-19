# Price Calculator depends on rules and cart
class PriceCalculator
  def initialize(rules, cart)
    @rules = rules
    @cart = cart
    @calculated = []
  end

  def calculate(item)
    return 0 if calculated.include?(item.sku)
    calculated << item.sku
    price_rule(item).get(count: count_by(item))
  end

  private

  attr_reader :rules, :cart
  attr_accessor :calculated

  def price_rule(item)
    rules[item.sku]
  end

  def count_by(item)
    cart.count_by(item)
  end
end
