# frozen_string_literal: true

require_relative('data')
require_relative('normal')
require_relative('discount')

module PriceRules
  class Schema
    @@rules = {}

    class << self
      def build(&block)
        instance_eval(&block)
        Data.new(@@rules)
      end

      def discount(sku:, amount:, discount_on:, discount_price:)
        @@rules[sku] = PriceRules::Discount.new(price: amount, discount_on: discount_on, discount_price: discount_price)
      end

      def normal(sku:, amount:)
        @@rules[sku] = PriceRules::Normal.new(price: amount)
      end
    end
  end
end
