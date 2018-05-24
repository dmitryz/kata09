# frozen_string_literal: true

# Price Calculator depends on rules and cart
module Calculators
  class Price
    def initialize(rules, cart)
      @rules = rules
      @cart = cart
      reset
    end

    def reset
      @calculated = []
    end

    def calculate(item)
      return 0 if calculated.include?(item.to_s)
      calculated << item.to_s
      price_rule(item).calculate(count: count_by(item))
    end

    private

    attr_reader :rules, :cart
    attr_accessor :calculated

    def price_rule(item)
      rules.get(item)
    end

    def count_by(item)
      cart.count_by(item)
    end
  end
end
