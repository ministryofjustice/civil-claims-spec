Feature: Social Landlord, Start a case, Check details

    @happypath
    Scenario: Start a new case, check details
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I check the details of the case
    And I confirm that all facts stated on the form are true 
    And I click the "Continue to next step" button
    Then I expect to be redirected to "/claims/:id/edit/court_fee"
    And the details I entered to have been saved

    @javascript @wip
  Scenario: Start a new case, confirm property details
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I confirm that the displayed details of the property address are correct
    Then I expect to see the address details I inputted when filling in "/claims/:id/edit/personal_details"

    @javascript @wip
  Scenario: Start a new case, confirm claimant details
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    Then I expect to see the address details as they are displayed on "/claims/:id/edit/personal_details"

    @javascript @wip
  Scenario: Start a new case, confirm tenant details
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I confirm that the displayed details for the tenant are correct
    Then I expect to see the tenant details I inputted when filling in "/claims/:id/edit/personal_details"

    @javascript @wip
  Scenario: Start a new case, confirm tenancy details
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I confirm that the displayed details about the tenancy are correct
    Then I expect to see the tenancy details I inputted when filling in "/claims/:id/edit/personal_details"

    @javascript @wip
  Scenario: Start a new case, confirm details about the case
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I confirm that the displayed details about the case are correct
    Then I expect to see the case details I inputted when filling in "/claims/:id/edit/personal_details"

     @wip
    Scenario: Start a new case, Statement of truth
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select Statement of truth
    Then I expect to see displayed a non selected tick box with explaining text
    And when I select the tick box I expect the tick box to be displayed as selected