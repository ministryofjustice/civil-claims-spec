Given(/^I am logged in as a Social Landlord delegate$/) do
  @app = App.new(RepossessionClaimData)
  @app.login('social_landlord')
end

Given(/^I start a new claim$/) do
  expect(@app.repossession_claim.displayed?).to be true
  click_link 'Start a new case'
end

# Step 1 default page state
Then(/^I expect that my pre\-filled personal business details are correct$/) do
  @app.repossession_claim.step_1.expect_correct_business_details
end

Then(/^I expect the page to contain (\d+) editable tenant sections$/) do |num|
  expect( @app.repossession_claim.step_1.tenants.tenant.size ).to eql num.to_i
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
    @app.repossession_claim.set_id
    @app.repossession_claim.step_2.send(method)
  else
    raise "Check #{__FILE__} for step definition"
  end
end

Given(/^I have created a claim with valid personal and case details$/) do
  step 'I start a new claim'
  step 'I complete Step 1 with valid data'
  step "I click the 'Continue to next step' button"
  step 'I complete Step 2 with valid data'
  step "I click the 'Continue to next step' button"
end

When(/^I click the '(.*)' button$/) do |button_text|
  click_on button_text
end

Then(/^I expect to be shown the Check Details page$/) do
  expect(@app.repossession_claim.step_3.displayed?).to be true
end

Then(/^the check details page shows the correct information$/) do
  @app.repossession_claim.step_3.expect_correct_details
end

When(/^I check the '(.*)' checkbox$/) do |checkbox|
  check checkbox
end

Given(/^I visit the check details page$/) do
  @app.repossession_claim.step_3.load id: @app.repossession_claim.id
end

Given(/^an email address and password for a social landlord account$/) do
  @app = App.new(RepossessionClaimData)
end

When(/^I login with these details$/) do
  @app.login('social_landlord')
end

Then(/^I should be presented with the landing page$/) do
  expect(@app.repossession_claim.displayed?).to be true
end