Feature: Adopting puppies

  Background:
    Given I am on the puppy adoption site

  Scenario Outline: Adopting a puppy
    When I click the view details button for Brook
    And I click the adopt me button
    And I click the complete the adoption button
    And I enter "<name>" in the name field
    And I enter "<address>" in the address field
    And I enter "<email>" in the email field
    And I select "<pay_type>" from the pay type dropdown
    And I click the place order button
    Then I should see "Thank you for adopting a puppy"

  Examples:
    | name   | address           | email              | pay_type       |
    | Cheezy | 123 Main St       | cheezy@example.com | Credit card    |
    | Sneezy | 555 Easy Money Dr | sneezy@example.com | Check          |
    | Wheezy | 999 Windy Blvd    | wheezy@example.com | Purchase order |

  Scenario: Adopting two puppies
    When I click the view details button for Brook
    And I click the adopt me button
    And I click the adopt another puppy button
    And I click the view details button for Hanna
    And I click the adopt me button
    And I click the complete the adoption button
    And I enter "Cheezy" in the name field
    And I enter "123 Main St" in the address field
    And I enter "cheezy@example.com" in the email field
    And I select "Credit card" from the pay type dropdown
    And I click the place order button
    Then I should see "Thank you for adopting a puppy"

  Scenario: Verify shopping cart with one puppy
    When I click the view details button for Brook
    And I click the adopt me button
    Then I should see "Brook" for the name on line item 1
    And I should see "$34.95" for the subtotal on line item 1
    And I should see "$34.95" for the cart total

  Scenario: Verify shopping cart with two puppies
    When I click the view details button for Brook
    And I click the adopt me button
    And I click the adopt another puppy button
    And I click the view details button for Hanna
    And I click the adopt me button
    Then I should see "Brook" for the name on line item 1
    And I should see "$34.95" for the subtotal on line item 1
    And I should see "Hanna" for the name on line item 2
    And I should see "$22.99" for the subtotal on line item 2
    And I should see "$57.94" for the cart total

