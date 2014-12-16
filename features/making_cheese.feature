Feature: Using the cheese machine

  As a cheeseball
  I want to make cheese
  So the world is a better place


  Scenario: Using the cheese machine
    Given I have no cheese
    When I press the make cheese button
    Then I should have one piece of cheese

