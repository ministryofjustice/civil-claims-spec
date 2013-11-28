@rbac
Feature: Role Based Access Matrix
  Scenario: New claim, personal details
    Given a new claim with a Property, Landlord and Tenant
    And I am authenticated as a user with <Role>
    When I try to perform <Action> on this claim
    Then I expect my request to be an <Outcome>
    Examples:
    | Role     | Action   | Outcome |
    | claimant | retrieve | success |
    | claimant | update   | success |
    | claimant | delete   | success |
    | tenant   | retrieve | failure |
    | tenant   | update   | failure |
    | tenant   | delete   | failure |
