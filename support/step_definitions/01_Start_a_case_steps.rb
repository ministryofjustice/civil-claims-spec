Given(/^I am logged in as a Social Landlord delegate$/) do
  # does nothing, auth is feature flagged off for now
end

Given(/^I have started a new claim, and filled in some valid personal_details$/) do
  step "I visit '/claims/new'"
  step "I enter valid details for the property"
  step "I enter valid details for at least one tenant"
  step "I click the 'Continue to next step' button"
end

When(/^I visit '(.*)'$/) do |path|
  visit path
end

When(/^I click the '(.*)' button$/) do |button_text|
  click_on button_text
end

Then(/^I expect to be redirected to '(.*?)'$/) do |path|
  /(\d+)/.match(current_path) { |m| @id = m[1] }
  regex = Regexp.new path.gsub(':id', '(\d+)')
  fail("Path mismatch. Expected #{path} but received #{current_url}") if !( current_url =~ regex ) 
end

Then(/^my personal details are persisted on the page at "(.*?)"$/) do |path|
  visit path.gsub(':id', @id)
  check_property_details(Data.repossession_claim_property_details)
  check_tenant_details(Data.repossession_claim_tenant)
end

Given(/^there are (\d+) concurrent users of the system$/) do |num_users|
  pending # express the regexp above with the code you wish you had
end

When(/^they each create a claim$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I expect page response times to remain under (\d+)ms$/) do |response_time|
  pending # express the regexp above with the code you wish you had
end

When(/^confirm that my pre\-filled personal business details are correct$/) do
  check_landlord_details(Data.repossession_claim_landlord)
end

When(/^I enter valid details for the property$/) do
  fill_in_property(Data.repossession_claim_property_details)
end

When(/^I enter valid details for at least one tenant$/) do
  fill_in_tenant(Data.repossession_claim_tenant)
end

When(/^I fill in some valid case_details$/) do
  fill_in_case(Data.repossession_claim_case)
end

Then(/^the details I entered to have been saved on "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I expect the initial state of the case_details page to be correct$/) do
  check_case_details_state
end