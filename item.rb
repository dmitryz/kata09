# frozen_string_literal: true

# Item
class Item
  def initialize(sku)
    @sku = sku
  end

  def to_s
    sku
  end

  def ==(another_item)
    to_s == another_item.to_s
  end

  private

  attr_reader :sku
end
