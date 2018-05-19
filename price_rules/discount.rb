module PriceRules
  # Discount rule, discount calculation depends on count
  class Discount
    attr_reader :price, :discount_on, :discount_price

    def initialize(price:, discount_on:, discount_price:)
      @price = price
      @discount_on = discount_on
      @discount_price = discount_price
    end

    def get(count:)
      discount_triggers(count) * discount_price +
        left_after_discounts(count) * price
    end

    private

    attr_reader :amount

    def discount_triggers(count)
      (count / discount_on).floor
    end

    def absobred_by_discounts(count)
      discount_triggers(count) * discount_on
    end

    def left_after_discounts(count)
      count - absobred_by_discounts(count)
    end
  end
end
