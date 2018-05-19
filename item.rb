# Item
class Item
  attr_reader :sku

  def initialize(sku)
    @sku = sku
  end

  def ==(another_item)
    self.sku == another_item.sku
  end
end
