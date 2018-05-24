# frozen_string_literal: true

# Cart of items implementation
class Cart
  def initialize
    @items = []
  end

  def push(item)
    items << item
  end

  def count_by(item)
    items.select { |i| i == item }.count
  end

  def process(calculator)
    calculator.reset
    items.map { |item| calculator.calculate(item) }
  end

  def scan(sku)
    push(Item.new(sku))
  end

  private

  attr_reader :items
end
