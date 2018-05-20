### Kata09: Back to the Checkout

1. Implemented Ruby philosophi of duck typing, on PriceRules module.
As such we can easily add any new custom price rule.
1. Comparable interface for items.
1. Developed DSL and abstract factory for PricingRule configuration, as result we can easily manage pricing rules and have more clean and readable code.
1. CheckOut class doesn't depend on item or price details and could process any types of Pricing rules. By implementing different calculators we can extend to support multiple factors calculation.


### How to run test:
`make`
