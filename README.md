# Cash Register Application

This application simulates a cash register that can calculate the total price based on specific rules for discounts. The architecture is designed to be modular and easily extendable, allowing new discount rules to be added by updating the `rules.yml` file.

## Architecture

The application is structured with the following components:

- **Product:** Represents a product with SKU, name, and price.
- **Discount Rules:** A set of rules defined in a YAML file (`rules.yml`) that specify how discounts are applied.
- **Cart:** Manages a collection of products with quantities.
- **Cash Register:** Calculates the final price based on the contents of the cart and the configured discount rules.

## Configuration

### Rule Configuration

Discount rules are configured in the `rules.yml` file. Each rule specifies the products to which it applies, the calculator class to use, and any additional parameters needed for the calculation. To extend functionality or add new rules, update the `rules.yml` file.

Example `rules.yml`:

```yaml
- rule_name: buy_one_get_one_free
  applicable_products:
    - GR1
  calculator: Rules::BuyOneGetOneFree

- rule_name: override_price_with_three_or_more_items_purchased
  applicable_products:
    - SR1
  calculator: Rules::ThreeOrMoreItemsPurchased::OverriddenPrice
  overridden_price: "4.50"

- rule_name: price_droped_by_with_three_or_more_items_purchased
  applicable_products:
    - CF1
  calculator: Rules::ThreeOrMoreItemsPurchased::PriceDropBy
  price_droped_by: "0.6667"
```

### Adding New Rules

To add new functionality or rules, update the rules.yml file with the desired rule configurations. Create corresponding calculator classes in the rules directory and follow the existing structure.

1. **Edit `rules.yml`:**
   - Open the `rules.yml` file.
   - Add a new rule configuration following the existing structure. Specify the `rule_name`, `applicable_products`, `calculator`, and any additional parameters required for the calculation.

   Example:
   ```yaml
   - rule_name: new_rule
     applicable_products:
       - PRODUCT_CODE
     calculator: Rules::NewRuleCalculator
     custom_parameter: "value"




### Create Calculator Class:

In the rules directory, create a new calculator class (new_rule_calculator.rb) following the existing structure.
Implement the calculate_discount method in the new calculator class.

```ruby
module Rules
  class NewRuleCalculator < Base
    def calculate_discount
      # Implementation of the new rule calculation
    end
  end
end

```

### How to Run

#### Clone the Repository:

```bash
git clone git@github.com:touseefmurtaza/cash-register-system.git
cd cash-register-app
```

#### Install Dependencies:

```bash
bundle install
```

#### Run the Program:
Execute the main.rb file to run predefined use cases.


```bash
ruby main.rb
```

#### Run Test Cases:

```bash
rspec .
```

### Use Cases

The program includes predefined use cases in the main.rb file. Feel free to modify the cart content or add your own use cases based on the defined products and rules.
