Feature: Create a claim
  In order to bring a case against a Tenant
  As a Social Landlord
  I want to create a Repossession Claim

  Background:
    Given I am logged in as a Social Landlord delegate
      And I have started a new claim
      And I have completed Step 1 with valid personal details
      And I have completed Step 2 with valid case details
      And the check details page shows the correct information

  @sprint2
  Scenario: Personal details
    Given I visit the Personal Details page
      And I have confirmed that my pre-filled personal business details are correct
     When I click the 'Continue to next step' button
     Then I expect to be shown the Case Details page

  @sprint2
  Scenario: Case details
  Given I visit the Case Details page
   When I fill in some valid case_details
    And I click the 'Continue to next step' button
   Then I expect to be shown the Check Details page

  @sprint2
  Scenario: Start a new case, check details
    Given I visit the Check Details page
     When I check the box to signify my confirmation of these details
      And I click the 'Continue to next step' button
     Then I expect to be shown the Court Fees page