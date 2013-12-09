Feature: Social Landlord, Submit Claim, Step 3

  @happypath @wip
  Scenario: Start a new case, check details
    Given I am logged in as a Social Landlord delegate
    When I create a new claim with valid details
    And and visit "/claims/:id/check_details"
    Then I confirm that all facts stated on the form are true
    And I complete the statement of truth
    Then I expect to be redirected to "/claims/:id/court_fee"
    And my acceptance the statement of truth has been captured

  @wip
  Scenario: Editing a claim after accepting SoT, before payment.
    Given I have created a claim, and accepted the SoT
    When I make a change to the claim details
    Then the Statement of Truth becomes invalidated
    And an error is displayed on "/claims/:id/court_fees"

  @wip
  Scenario: Make changes to previously added details
    Given I have created a claim
    And I visit "/claims/:id/check_details"
    When I click the Make Changes link next to the <section>
    Then I expect to be on the <url> page

  Examples:
  | section           | url                                   |
  | Property details  | /claims/:id/personal_details#property |
  | Tenant details    | /claims/:id/personal_details#tenants  |
  | About the case    | /claims/:id/case_details#about        |
  | About the tenancy | /claims/:id/case_details#about..whatever |