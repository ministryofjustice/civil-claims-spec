Feature: Social Landlord, Submit Claim, Step 1

  @happypath
  Scenario: Create a new claim, with personal details
    Given I am logged in as a Social Landlord
    When I visit '/claims/new'
    And fill in the form with my personal details
    And and no validation errors have occurred
    And I click the 'Continue to next step' button
    Then I expect to be redirected to the claim page
    And my details to be present on the page

  @validations
  Scenario Outline: Character length validation
    When I visit '/claims/new'
    And I am filling in the step1 <formitem>
    And I enter the <text>
    Then I expect it to <validate>
    And return the <message>

    Examples:
    | formitem | text | validate | message                                         |
    | email    | abc  | fail     | Email address must be in format name@server.com |

  @ia
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

  @performance
  Scenario: Creating a claim under load
    Given there are 100 concurrent users of the system
    When they each create a claim
    Then I expect page response times to remain under 200ms

  @performance
  Scenario: Retrieving a claim under load
    Given there are 1000 concurent users of the system
    When they all retrieve a claim
    Then I expect page response times to remain under 5ms