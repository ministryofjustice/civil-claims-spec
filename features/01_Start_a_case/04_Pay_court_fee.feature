Feature: As a social landlord
I wish to be informed of my hearing date,
have my payment details clarified,
and agree terms
So that I can pay, and send the case to court.

Scenario: Happy path
 Given I am logged in as a social landlord
   And I have created a claim, and completed steps 1-3
   And I visit step 4
   And I expect to see the name of the court, and provisional hearing date
   And I expect my payment details to be displayed and correct
  When I accept the terms & conditions
  And I click 'Pay and send case to the court'
  Then I expect to be presented with Step 5

Scenario: Case state change
 Given I have created a claim
 When I pay and send
 Then I expect the state of the case to change from draft to submitted