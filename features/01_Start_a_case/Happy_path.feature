Feature: Create a claim
  In order to bring a case against a Tenant
  As a Social Landlord
  I want to create a Repossession Claim

  @sprint2
  Scenario: Create a claim
    Given I am logged in as a Social Landlord delegate
      And I start a new claim
     When I complete Step 1 with valid data
      And I click the 'Continue to next step' button
      And I complete Step 2 with valid data
      And I click the 'Continue to next step' button 
     Then I expect to be shown the Check Details page
      And the check details page shows the correct information

  @sprint3
  Scenario: Login
   Given an email address and password for a social landlord account
    When I login with these details
    Then I should be presented with the landing page