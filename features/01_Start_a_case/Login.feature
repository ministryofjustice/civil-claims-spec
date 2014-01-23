Feature: Login
  As a Social Landlord
  I want to login to UCC
  So I am able to submit a claim

  @sprint3 @wip
  Scenario Outline: Incorrect login details
   Given a <username> and <password>
    When I login with these details
    Then I am presented with the login page
     And I see the following <error> message

    Examples:
    | username        | password       | error  |
    | test@user.com   | 12345678       | Incorrect username or password |

  @sprint3
  Scenario: Logout
   Given I am logged in as a Social Landlord delegate
    When I click the Signout link
    Then I should be logged out of the application


# Scenario: Session timeout
# - research task to figure out an acceptable session timeout or if this is required

# Scenario: Prevent username enumeration
# - rate limit / IP filter persistant login attempts which get the username wrong

  @sprint3 @wip
  Scenario: Multiple login failures lock account
    Given the username of a registered Social Landlord delegate
     When I try to login with the wrong password 5 times in a row
     Then I should see a message stating 'Your account has been locked, please speak to a court administrator'
      And I should not be able to login to this account