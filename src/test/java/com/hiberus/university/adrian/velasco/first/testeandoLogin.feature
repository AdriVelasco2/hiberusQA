Feature: Login functionality

  Scenario Outline: Successful login with valid credentials
    Given I am on the login page "<url>"
    When I enter "<username>" into the "username" field
    And I enter "<password>" into the "password" field
    And I click the "Login" button
    Then I should be redirected to "<redirected_url>"

    Examples:
      | url                        | username      | password      | redirected_url                            |
      | https://www.saucedemo.com  | standard_user | secret_sauce  | https://www.saucedemo.com/inventory.html  |

  Scenario Outline: Invalid login with incorrect username
    Given I am on the login page "<url>"
    When I enter "<username>" into the "username" field
    And I enter "<password>" into the "password" field
    And I click the "Login" button
    Then I should see an error message displayed

    Examples:
      | url                        | username | password      |
      | https://www.saucedemo.com  | standard | secret_sauce  |
