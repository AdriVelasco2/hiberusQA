Feature: Cart Management

  Background:
    Given I am on the login page "https://www.saucedemo.com"
    And I enter "<username>" into the "username" field
    And I enter "<password>" into the "password" field
    And I click the "Login" button
    And I add 2 random products to the cart

  Scenario Outline: Remove product from cart
    When I go to the cart
    And I remove one of the products
    Then the removed product should not appear in the cart

    Examples:
      | username      | password     |
      | standard_user | secret_sauce |
      | admin_user    | admin_pass   |
