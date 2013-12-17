Feature: Social Landlord, Start a case, Case details

    @initial_state
    Scenario: Before entering case details, check initial state of page
    Given I am logged in as a Social Landlord delegate
    And I visit '/claims/new'
    And I enter valid details for the property
    And I enter valid details for at least one tenant
    And I click the 'Continue to next step' button
    Then I expect the initial state of the page to be correct

    @happypath
    Scenario: Enter case details, new case
    Given I am logged in as a Social Landlord delegate
    And I visit '/claims/new'
    And I enter valid details for the property
    And I enter valid details for at least one tenant
    And I click the 'Continue to next step' button
    When I fill in some valid case_details
    And I click the 'Continue to next step' button
    Then I expect to be redirected to '/claims/:id/check_details'
    And the details I entered to have been saved on '/claims/:id/case_details'

    @wip
    Scenario: Start a new case, selecting tenancy type
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select the tenancy type
    Then I expect to see a list of options as radio buttons
    And I expect to see the "Secure tenancy" radio button pre-selected
    And when I select any other radio button
    And I expect to see that option selected

    @wip
    Scenario: Start a new case, selecting tenancy start date
    Given I am logged in as a Social Landlord delegate
    And I have started a new claim, and filled in some valid personal_details
    And I visit "/claims/:id/case_details"
    Then I expect to see a dropdown for "day" for "month" for "year"
    And I expect when selecting "day" to be displayed a dropdown with 31 days
    And I expect when selecting "month" to be displayed a dropdown with the 12 months
    And I expect when selecting "year" to be displayed a dropdown with the current year at the top of the list and a list of years back to "1932"

    @wip
    Scenario: Start a new case, inputting rent amount
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select Rent amount
    Then I expect to see displayed a text input field
    And when I input numerals into the field I expect them to be displayed back to me in the correct format
    And I expect to see displayed a dropdown with "per week" or "per month"
    And I expect to see "per week" as the default selection

    @wip
    Scenario: Start a new case, inputting daily rent amount
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select Daily Rent amount
    Then I expect to see displayed a text input field
    And when I input numerals into the field I expect them to be displayed back to me in the correct format

     @wip
    Scenario: Start a new case, selecting notices sent
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select the notices served
    Then I expect to see a list of options as radio buttons
    And when I select a radio button
    And I expect to see a date picker persistently displayed for the selected option

     @wip
    Scenario: Start a new case, selecting date for when a notice is sent
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select the notices served
    And I select a notice type
    And I expect to see a date picker persistently displayed for the selected option
    Then I expect to see a dropdown for "day" for "month" for "year"
    And I expect when selecting "day" to be displayed a dropdown with 31 days
    And I expect when selecting "month" to be displayed a dropdown with the 12 months
    And I expect when selecting "year" to be displayed a dropdown with the current year at the top of the list and a list of years back to 1990
    And depending on which "month" I select I expect the "day" dropdown to display the correct number of calendar days
    And I expect when selecting a leap "year" to be displayed the correct number of calendar "days" in "month" of February

    @wip
    Scenario: Start a new case, inputting total unpaid rent
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select Total unpaid rent
    Then I expect to see displayed a text input field
    And when I input numerals into the field I expect them to be displayed back to me in the correct format

    @wip
    Scenario: Start a new case, further information
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select Further information
    Then I expect to see displayed a resizable text input field
    And when I input text into the field I expect the text to be displayed back to me
    And when I resize the text input field I expect the text to realign

    @wip
    Scenario: Start a new case, Human Rights Act
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I select The case includes issues under the Human Rights Act 1998
    Then I expect to see displayed a non selected tick box
    And when I select the tick box I expect the tick box to be displayed as selected

    @validations @wip
    Scenario Outline: Numeral input validation
    When I visit "/claims/new"
    And I am filling in the claim details <formitem>
    And I enter the <text>
    Then I expect it to <validate>
    And return the <message>

    Examples:
    | formitem          | text | validate | message                 |
    | rent amount       | abc  | fail     | Numerals only           |
    | daily rent amount | abc  | fail     | Numerals only           |
    | total unpaid rent | abc  | fail     | Numerals only           |

    @validations @wip
    Scenario Outline: numeral length validation
    When I visit "/claims/new"
    And I am filling in the claim details <formitem>
    And I enter the <text>
    Then I expect it to <validate>
    And return the <message>

    Examples:
    | formitem          | text        | validate | message                   |
    | rent amount       | 1234567890  | fail     | Rent amount seems too big |
    | daily rent amount | 1234567890  | fail     | Rent amount seems too big |
    | total unpaid rent | 1234567890  | fail     | Rent amount seems too big |

     @validations @wip
    Scenario Outline: numeral validation
    When I visit "/claims/new"
    And I am filling in the claim details <formitem>
    And I enter the <text>
    Then I expect it to <validate>
    And return the <message>

    Examples:
    | formitem          | text  | validate | message                          |
    | rent amount       | 0123  | fail     | Rent amounts cannot start with 0 |
    | daily rent amount | 0123  | fail     | Rent amounts cannot start with 0 |
    | total unpaid rent | 0123  | fail     | Rent amounts cannot start with 0 |

     @validations @wip
    Scenario Outline: numeral amount validation
    When I visit "/claims/new"
    And I am filling in the claim details <formitem>
    And I enter the <text>
    Then I expect it to <validate>
    And return the <message>

    Examples:
    | formitem                                 | text | validate | message                                            |
    | daily rent amount related to rent amount | 123  | fail     | Daily rent amount cannot be higher than "x" amount |

    @wip
    Scenario Outline: Radio buttons validation
    Given I am logged as a Social Landlord delegate
    And I visit the case details page of the claim form
    And I click on "Continue to next step"
    And I don't select any choice for <choice>
    Then I expect it to fail
    And return the <message>

    Examples:
    | choice                  | message                                  |
    | Tenancy start date      | You must indicate tenancy start date     |
    | Rent amount             | You must indicate the rent amount        |
    | Daily rent amount       | You must indicate the daily rent amount  |
    | Total unpaid rent       | You must indicate the total unpaid rent  |

    @ia @wip
    Scenario Outline: Access control
    Given a new claim with a Property, Landlord and Tenant
    And I authenticate as a <Role>
    When I try to <Action> this claim
    Then I expect my request to <Outcome>

    Examples:
    | Role     | Action   | Outcome |
    | claimant | retrieve | succeed |
    | claimant | update   | succeed |
    | claimant | delete   | succeed |
    | tenant   | retrieve | fail    |
    | tenant   | update   | fail    |
    | tenant   | delete   | fail    |

  @performance @wip
  Scenario: Creating a claim under load
    Given there are 100 concurrent users of the system
    When they each create a claim
    Then I expect page response times to remain under 200ms

  @performance @wip
  Scenario: Retrieving a claim under load
    Given there are 1000 concurent users of the system
    When they all retrieve a claim
    Then I expect page response times to remain under 5ms
    