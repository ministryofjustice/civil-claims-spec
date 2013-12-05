Given(/^the site contains no claims$/) do
  Claim.delete_all
end

Given(/^I am logged in as a Social Landlord$/) do
  #pending
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
 # pending
end

When(/^I click the '(.*)' button$/) do |button_text|
  click_on button_text
end

Then(/^I expect to be redirected to "(.*?)"$/) do |path|
  regex = Regexp.new path.gsub(':id', '(\d+)')
  fail("Path mismatch. Expected #{path} but received #{current_url}") if !( current_url =~ regex ) 
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
