Feature: As a social landlord
  I wish to be informed of my hearing date,
  have my payment details clarified,
  and agree terms
  So that I can pay, and send the case to court.

  @sprint3 @wip
  Scenario: Happy path
   Given I am logged in as a Social Landlord delegate
     And I have created a claim with valid personal and case details, and accepted the statement of truth
     And I visit step 4
     And I expect to see the name of the court, and provisional hearing date
     And I expect my payment details to be displayed and correct
    When I accept the terms & conditions
     And I click 'Pay and send case to the court'
    Then I expect to be presented with Step 5

  @sprint3 @wip @no-automation
  Scenario: Case state change
   Given I have created a claim
    When I pay and send
    Then I expect the state of the case to change from draft to submitted