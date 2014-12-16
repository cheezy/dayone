Feature: Adopting puppies

  Background:
    Given I am on the puppy adoption site

  Scenario: Thank you message should display after an adoption is completed
    When I complete an adoption
    Then I should see "Thank you for adopting a puppy"

  Scenario: Name is required when checking out
    When I attempt to checkout without a name
    Then I should see the error message "Name can't be blank"

  Scenario: Message should display after processing puppy
    Given I have an order for "Donnald Duck"
    When I process that order
    Then I should see "Please thank Donnald Duck for the order"

