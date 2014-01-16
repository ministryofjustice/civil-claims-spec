Feature: Create a claim
  In order to bring a case against a Tenant
  As a Social Landlord
  I want to create a Repossession Claim

  @sprint3
  Scenario: Create a claim
    Given I am logged in as a Social Landlord delegate
      And I have created a claim with valid personal and case details 
      And the check details page shows the correct information
      And I have accepted toe statement of truth
      And the payment information is correct
     When I click the 'Pay and send case to the court' button
     Then I expect to see my case number displayed
      And the details of the case to be correct

  @sprint3
  Scenario: Login
   Given an email address and password for a social landlord account
    When I login with these details
    Then I should be presented with the landing page
     And my name should be shown in the page header