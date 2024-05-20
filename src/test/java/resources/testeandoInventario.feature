Feature: Inventory Management

  Background:
    Given I am on the login page "https://www.saucedemo.com"
    And I enter "<username>" into the "username" field
    And I enter "<password>" into the "password" field
    And I click the "Login" button

  Scenario Outline: Validate number of products is <expected_count>
    When I validate the number of products
    Then the number of products should be <expected_count>

    Examples:
      | username      | password     | expected_count |
      | standard_user | secret_sauce | 6             |
      | admin_user    | admin_pass   | 10            |

  Scenario Outline: Validate presence of specific product in inventory
    When I validate the presence of product "<product_name>" in the inventory
    Then the product "<product_name>" should be present in the inventory

    Examples:
      | username      | password     | product_name           |
      | standard_user | secret_sauce | Sauce Labs Bolt T-Shirt |
      | admin_user    | admin_pass   | Fleece Jacket          |

  Scenario Outline: Add product to cart
    When I add the product "<product_name>" to the cart
    Then the cart icon should display "<expected_count>" product(s)

    Examples:
      | username      | password     | product_name           | expected_count |
      | standard_user | secret_sauce | Sauce Labs Bolt T-Shirt | 1              |
      | admin_user    | admin_pass   | Backpack                | 1              |

  Scenario Outline: Remove product from cart
    When I add the product "<product_name>" to the cart
    And I remove the product "<product_name>" from the cart
    Then the cart icon should display "<expected_count>" product(s)

    Examples:
      | username      | password     | product_name           | expected_count |
      | standard_user | secret_sauce | Sauce Labs Bolt T-Shirt | 0              |
      | admin_user    | admin_pass   | Fleece Jacket           | 0              |

  Scenario Outline: Add multiple products to cart
    When I add "<product_count>" random products to the cart
    Then the cart icon should display "<expected_count>" product(s)

    Examples:
      | username      | password     | product_count | expected_count |
      | standard_user | secret_sauce | 3             | 3              |
      | admin_user    | admin_pass   | 5             | 5              |

  Scenario Outline: Sort inventory by name
    When I select the filter "Name (Z to A)"
    Then the inventory should be sorted alphabetically from Z to A

    Examples:
      | username      | password     |
      | standard_user | secret_sauce |
      | admin_user    | admin_pass   |

  Scenario Outline: Sort inventory by price (low to high)
    When I select the filter "Price (low to high)"
    Then the inventory should be sorted by price from low to high

    Examples:
      | username      | password     |
      | standard_user | secret_sauce |
      | admin_user    | admin_pass   |

  Scenario Outline: Sort inventory by price (high to low)
    When I select the filter "Price (high to low)"
    Then the inventory should be sorted by price from high to low

    Examples:
      | username      | password     |
      | standard_user | secret_sauce |
      | admin_user    | admin_pass   |
