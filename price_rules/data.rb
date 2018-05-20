# frozen_string_literal: true

module PriceRules
  class Data
    def initialize(rules)
      @rules = rules
    end

    def get(item)
      rules[item.to_s]
    end

    private

    attr_reader :rules
  end
end
