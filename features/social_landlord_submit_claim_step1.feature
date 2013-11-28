Feature: Social Landlord, Submit Claim, Step 1

  @happypath
  Scenario: Create a new claim, with personal details
    Given I am logged in as a Social Landlord
    When I visit '/claim/new'
    And fill in the form with my personal details
    And and no validation errors have occurred
    And I click the 'Continue to next step' button
    Then I expect the page to refresh
    And my personal details are present in the form

  @validations
  Scenario Outline: Character length validation
    Given I visit '/claim/new'
    When I am filling in the step1 <formitem>
    And I enter the <text>
    Then I expect it to <validate>
    And return the <message>

    Examples:
    | formitem | text | validate | message                                         |
    | email    | abc  | fail     | Email address must be in format name@server.com |