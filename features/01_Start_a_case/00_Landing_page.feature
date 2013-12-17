Feature: Social Landlord, Start a Case, Landing Page

  @happypath @wip
  Scenario: Start a new claim
    Given I am logged in as a Social Landlord delegate
    When I visit '/claims/new'
    And I click the "Start a new case" button
    Then I expect to be redirected to "/claims/:id/personal_details"
