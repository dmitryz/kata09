module PriceRules
  # Usual price rule
  class Normal
    def initialize(price:)
      @amount = price
    end

    def get(count:)
      amount * count
    end

    private

    attr_reader :amount
  end
end
