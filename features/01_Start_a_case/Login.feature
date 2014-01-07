Feature: As a Social Landlord
I want to login to UCC
So I am able to submit a claim

Scenario: Happy Path
 Given an email address and password for a social landlord account
 When I login with these details
 Then I should be presented with the landing page

Scenario: Incorrect login details
 Given a <username> and <password>
 When I login with these details
 Then I am presented with the login page
 And I see the following <error message>

Scenario: Logout
 Given I am logged in as a social landlord
 When I click the Signout button
 Then I should be logged out of the application

Scenario: Session timeout
 - research task to figure out an acceptable session timeout or if this is required

Scenario: Prevent username enumeration
 - rate limit / IP filter persistant login attempts which get the username wrong

Scenario: Multiple login failures
 - lock accounts where password has been submitted incorrectly 5 times in a row

Scenario: Timing side-channel attack mitigation
 - question for the devise-auth service mainly
