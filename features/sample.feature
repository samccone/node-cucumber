Feature: visiting google
  Scenario: I visit google
    Given I visit "http://www.google.com"
    Then I can see the google home page
