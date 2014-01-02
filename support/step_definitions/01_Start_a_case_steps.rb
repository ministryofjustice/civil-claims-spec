Given(/^I am logged in as a Social Landlord delegate$/) do
  @app = App.new(RepossessionClaimData)
end

Given(/^I start a new claim$/) do
  @app.repossession_claim.load
end

# Step 1 default page state
Then(/^I expect that my pre\-filled personal business details are correct$/) do
  @app.repossession_claim.step_1.expect_correct_business_details
end

Then(/^I expect the page to contain (\d+) editable tenant sections$/) do |num|
  expect(@app.repossession_claim.step_1.tenants.size).to eql num.to_i
end

# Step 2 default page state
Then(/^I expect the Tenancy type radio button to default to '(.*)'$/) do |val|
  expect(@app.repossession_claim.step_2.tenancy_type.has_checked_field? val).to be true
end

Then(/^I expect the Rent amount frequency dropdown to default to '(.*)'$/) do |default_value|
  expect(@app.repossession_claim.step_2.about_the_tenancy.rent_payment_frequency).eql default_value
end

Given(/^I complete (.*) with (valid|invalid) data$/) do |step, validity|
  method = "complete_form_with_#{validity}_data"
  case step
  when "Step 1"
    @app.repossession_claim.step_1.send(method)
  when "Step 2"
    @app.repossession_claim.step_2.send(method)
  else
    raise "Check #{__FILE__} for step definition"
  end
end

When(/^I click the '(.*)' button$/) do |button_text|
  click_on button_text
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

Given(/^I have created a claim with valid personal and case details$/) do
 step "I have started a new claim, and filled in some valid personal_details"
 step "I fill in some valid case_details"
 step "I click the 'Continue to next step' button"
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

Then(/^the case details I entered to have been saved on '(.*)'$/) do |path|
  visit path.gsub(':id', @id)
  check_case_detail(Data.repossession_claim_case)
end


Given(/^I confirm that all facts stated on the form are true$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I check the '(.*)' checkbox$/) do |checkbox|
  check(checkbox)
end

Then(/^my acceptance the statement of truth has been captured$/) do
  pending # express the regexp above with the code you wish you had
end