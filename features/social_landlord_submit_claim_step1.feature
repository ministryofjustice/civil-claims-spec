@happypath
Feature: Social Landlord, Submit Claim, Step 1
  Scenario: Create a new claim, with personal details
    Given I am logged in as a Social Landlord
    When I visit '/claim/new'
    And fill in the form with my personal details
    And and no validation errors have occurred
    And I click the 'Continue to next step' button
    Then I expect the page to refresh
    And my personal details are present in the form

