Feature: Social Landlord, Submit Claim, Step 3

  Background:
    Given I am logged in as a Social Landlord delegate
      And I have created a claim with valid personal and case details
      And I visit the check details page

  @sprint2 @wip
  Scenario: Get to step 3, edit Property details
    Given I visit "/claims/:id/check_details"
     When I click the 'Make Changes' link in the 'Property' section
      And I edit the 'postcode' to 'ABC123'
      And I click the 'Continue to next step' button
      And I am redirected to '/claims/:id/case_details'
      And I click the 'Continue to next step' button
      And I am redirected to '/claims/:id/check_details'
     Then I expect to see my change represented on the page in the Property address

  @sprint2 @wip
  Scenario: Get to step 3, edit Tenant details
    Given I visit "/claims/:id/check_details"
     When I click the 'Make Changes' link in the 'Tenant (defendant)' section
      And I edit the 'name' of the first tenanct to 'ABC123'
      And I click the 'Continue to next step' button
      And I am redirected to '/claims/:id/case_details'
      And I click the 'Continue to next step' button
      And I am redirected to '/claims/:id/check_details'
     Then I expect to see my change represented on the page in the Tenants name

  @sprint2 @wip
  Scenario: Editing a claim after accepting SoT, before payment.
    Given I have created a claim, and accepted the SoT
     When I make a change to the claim details
     Then the Statement of Truth becomes invalidated
      And an error is displayed on "/claims/:id/court_fees"

  @wip
  Scenario Outline: Make changes to previously added details
    Given I have created a claim
      And I visit "/claims/:id/check_details"
     When I click the Make Changes link next to the <section>
     Then I expect to be on the <url> page

  Examples:
  | section           | url                                      |
  | Property details  | /claims/:id/personal_details#property    |
  | Tenant details    | /claims/:id/personal_details#tenants     |
  | About the case    | /claims/:id/case_details#about           |
  | About the tenancy | /claims/:id/case_details#about..whatever |
