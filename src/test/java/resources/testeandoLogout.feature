Feature: Logout Process

  Background:
    Given I am on the login page "https://www.saucedemo.com"
    And I enter "<username>" into the "username" field
    And I enter "<password>" into the "password" field
    And I click the "Login" button

  Scenario Outline: Verify logout functionality
    When I logout
    Then I should be redirected to the login page

    Examples:
      | username      | password     |
      | standard_user | secret_sauce |
      | admin_user    | admin_pass   |
