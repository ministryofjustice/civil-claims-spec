Given(/^the site contains no claims$/) do
  Claim.delete_all
end

Given(/^I am logged in as a Social Landlord$/) do
  # do nothing.
end

When(/^I visit '(.*)'$/) do |url|
  visit url
end

When(/^fill in the form with my personal details$/) do
  fill_in_property(Data.repossession_claim_property_details)
  fill_in_landlord(Data.repossession_claim_landlord)
  fill_in_tenant(Data.repossession_claim_tenant)
end

When(/^and no validation errors have occurred$/) do
  # do nothing for now
end

When(/^I click the '(.*)' button$/) do |button_text|
  click_on button_text
end

Then(/^I expect to be redirected to the claim page$/) do
  expect( current_url =~ /claims\/(\d+)/ ).to_not be nil
end

Then(/^my details to be present on the page$/) do
  check_property_details(Data.repossession_claim_property_details)
end

When(/^I am filling in the step1 (.*)$/) do |formitem|
  
end

When(/^I enter the (.*)$/) do |text|
  
end

Then(/^I expect it to (.*)$/) do |outcome|
  
end

Then(/^return the (.*)$/) do |message|
  
end