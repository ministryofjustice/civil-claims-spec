Feature: As a social landlord
  I want to see confirmation that my case has been submitted to the court
  So I can confirm that the correct action has been taken

  @sprint3 @wip
  Scenario: Happy Path
    Given I am logged in as a social landlord
      And I have created a claim
     When I visit step 5
     Then I can see the case number
      And I can see a receipt for my payment
      And I can see a summary of the case details
      And I can see case status

  # @sprint3 @wip
  # Scenario: Call to Action
  #   - There should be a button