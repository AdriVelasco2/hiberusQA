Feature: Checkout Process

  Background:
    Given I am on the login page "https://www.saucedemo.com"
    And I enter "standard_user" into the "username" field
    And I enter "secret_sauce" into the "password" field
    And I click the "Login" button

  Scenario Outline: Verify final price of checkout for multiple products
    When I add "<product_count>" random products to the cart
    And I go to the cart
    And I proceed to checkout
    And I fill out checkout information and continue
    And I finalize the checkout
    Then the total price of the order should be the sum of the prices of selected products

    Examples:
      | product_count |
      | 3             |
      | 5             |

  Scenario: Place an order
    When I add 1 random product to the cart
    And I go to the cart
    And I proceed to checkout
    And I fill out checkout information and continue
    And I finalize the checkout
    Then I should see the message "Your order has been dispatched, and will arrive just as fast as the pony can get there!"
