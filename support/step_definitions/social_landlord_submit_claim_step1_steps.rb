 When(/^I visit '(.*)'$/) do |path|
  visit path
end

When(/^fill in the form with my personal details$/) do
  fill_in_property(Data.repossession_claim_property_details)
  fill_in_tenant(Data.repossession_claim_tenant)
end

When(/^I click the '(.*)' button$/) do |button_text|
  click_on button_text
end

Then(/^I expect to be redirected to "(.*?)"$/) do |path|
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
