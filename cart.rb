# Cart of items implmentation
class Cart
  def initialize
    @items = []
  end

  def push(item)
    items << item
  end

  def count_by(item)
    items.select { |i| i.sku == item.sku }.count
  end

  def process(rules, klass_calculator)
    calculator = klass_calculator.new(rules, self)
    items.map { |item| calculator.calculate(item) }
  end

  def scan(sku)
    push(Item.new(sku))
  end

  private

  attr_reader :items
end
