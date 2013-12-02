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