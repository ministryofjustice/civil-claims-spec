Feature: Social Landlord, Start a case, Personal details

  @happypath
  Scenario: Start a new case, with personal details
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And confirm that my pre-filled personal business details are correct
    And I enter the details of the tenant
    And I click the "Continue to next step" button
    Then I expect to be redirected to "/claims/:id/edit/case_details"
    And the details I entered to have been saved

  @javascript @wip
  Scenario: Start a new case, selecting a property postcode
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter "PA5 0PL" in the Property section
    And press the "Find UK address" button
    And select "34 Privet Drive, London" from the dropdown
    Then I expect to see "34 Privet Drive" in the Street field
    And I expect to see "London" in the Town field

   @wip
  Scenario: Start a new case, entering an address manually
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details of the tenant's property
    And I click on "Enter address manually"
    Then I expect to see input fields appear for Street, Town, Postcode
    And that lets me enter address details manually
    And I expect to see the words "34 Privet Drive" in the Street input field
    And I expect to see the word "London" in the Town input field
    And I expect to see the letters "PA5 0PL" in the Postcode input field
    And when I enter text into the Postcode field I expect the inputted text to be validated

  @javascript @wip
  Scenario: Start a new case, confirm claimant's address and contact details
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I confirm that the displayed details of the claimant are correct
    Then I expect to see the correct Social Landlord name
    Then I expect to see the correct contact address (including street and postcode)
    Then I expect to see the correct name of the Social Landlord delegate 

  @wip
  Scenario: Start a new case, enter a Land Registry title number
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details of the tenant's property
    And I click on "Would you like to provide a title number?"
    Then I expect to see an input field appear 
    And that lets me enter a title number
    And I can validate title number on Land Registry database

    @wip
  Scenario: Start a new case, enter how many tenants there are in the property
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details about the tenant
    And I click on "You're taking court action against"
    Then I expect to be able to select numerals up to 4 
    And that lets me enter a number of tenants in the property
    And I can see the number of tenants displayed

     @wip
  Scenario: Start a new case, enter tenant's title
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details about the tenant
    And I click on "Title"
    Then I expect to be able to select a title (eg Mr, Ms etc) from a dropdown list
    And that lets me enter the tenant's title
    And I can see the tenant's title displayed

     @wip
  Scenario: Start a new case, enter tenant's name
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details about the tenant
    And I enter the tenant's full name 
    Then I expect to see an input field displayed
    And that lets me enter the tenant's full name
    And I expect to be able to enter as many characters as I like
    And I can see the tenant's name displayed

    @wip
  Scenario: Start a new case, confirm whether they are living in the property or not
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details about the tenant
    And I confirm whether the tenant is living in the property in question or not 
    Then I expect to see two radio buttons displayed
    And that lets me select either "Yes" or "No"
    And I expect when I select either for the radio button to be displayed as Selected
    And I select "Yes" I expect there no be no change to the display of the page
    And I select "No" I expect to be displayed a postcode input field
    And I select "No" I expect to be displayed an enter address manually

    @wip
  Scenario: Start a new case, confirm whether they are living in the property or not
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details about the tenant
    And I confirm whether the tenant is living in the property in question or not
    And I select "No" I expect to be able to enter an address manually
    And I click on "Enter address manually"
    Then I expect to see input fields appear for Street, Town, Postcode 
    And that lets me enter address details manually
    And I enter text into the Postcode field I expect the inputted text to be validated

    @wip
  Scenario: Start a new case, enter tenant's mobile number
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details about the tenant
    And I want to enter the tenant's contact telephone number 
    Then I expect to see an input field displayed
    And that lets me enter the tenant's contact telephone number
    And validates the inputted characters after they are entered so that they display the correct pattern for a UK telephone number (mobile or landline)
    And I can see the tenant's contact telephone number displayed formatted correctly

 @wip
  Scenario: Start a new case, enter tenant's email address
    Given I am logged in as a Social Landlord delegate
    When I visit "/claims/new"
    And I enter details about the tenant
    And I want to enter the tenant's email address 
    Then I expect to see an input field displayed
    And that lets me enter the tenant's email address
    And validates the inputted characters after they are entered so that they display the correct pattern for an email address
    And I can see the tenant's email address displayed formatted correctly

  @validations @wip
  Scenario Outline: Character length validation
    When I visit "/claims/new"
    And I am filling in the personal details <formitem>
    And I enter the <text>
    Then I expect it to <validate>
    And return the <message>

    Examples:
    | formitem       | text | validate | message                                         |
    | tenant-email   | abc  | fail     | Email address must be in format name@server.com |
    | postcode       | abc  | fail     | This is not a valid postcode                    |

  @wip
  Scenario Outline: Radio buttons validation
    Given I am logged as a Social Landlord delegate
    And I visit the personal details page of the claim form
    And I click on "Continue to next step"
    And I don't select any choice for <choice>
    Then I expect it to fail
    And return the <message>

    Examples:
    | choice                    | message                                    |
    | "Who is in the Property?" | "You must indicate who is in the property" |
    | "Address"                 | "You must indicate where the tenants are"  |


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