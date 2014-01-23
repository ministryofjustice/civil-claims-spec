Feature: Social Landlord // Landing page
  As a social landlord
  I want to see a landing page when I log in
  So I can see the options available to me

  @sprint3 @wip
  Scenario: Happy Path
   Given an email address and password for a social landlord account
    When I login with these details
    Then I should be presented with the landing page

  @sprint3 @wip
  Scenario: Start a claim
    Given I am logged in and viewing the landing page
     When I click the 'Start a new claim' button
     Then I should be presented with the step 1 claim form