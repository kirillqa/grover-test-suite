Feature: This feature describes some basic scenarios for user in which user should be able to:
  - sign up to the website
  - login as newly created user
  - add specific product to shopping cart

  Scenario: User should be able to navigate to Sign Up page
    Given I open website
    Then I should see index page
    When I click on Login link from navigation menu
    Then I should see login form
    When I click on sign up link
    Then I should see sign up page

  Scenario: User should be able to sign up new account
    Given I am on 'Sign up' page
    When I submit sign up form with the following data:
      | first_name | last_name | email         | password | confirm_password |
      | John       | Dow       | test@user.com | robot123 | robot123         |
    Then I should see welcome page
    And should see 'Willkommen in Grover !' on welcome page
    And should be redirected to user home page

  Scenario: Valid user should be able to login

    Given I am on 'Login' page
    When I submit login form with the following data:
      | email         | password |
      | test@user.com | robot123 |
    Then I should see user home page

  Scenario Outline: User should be able to add product to shopping card
    Given I login as:
      | email         | password |
      | test@user.com | robot123 |
    When I open 'wolfenstein-old-blood-xbox-one-543' product page
    Then I should see the following product details:
      | title     | shipment                                   | product_cost | price_per_month  |
      | <product> | Lieferung in: 2-5 Tage Versand und Zahlung | UVP: 60,00 € | 7,99 € pro Monat |
    When I click on 'add product to cart' button
    Then I should see '1' item of '<product>' in shopping cart pop up

    Examples:
      | product                          |
      | Wolfenstein Old Blood - Xbox One |
