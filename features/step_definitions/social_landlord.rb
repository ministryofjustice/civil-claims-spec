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
  fill_in_valid_property
  fill_in_valid_landlord
  fill_in_valid_tenant
end

When(/^and no validation errors have occurred$/) do
  # do nothing for now
end

When(/^I click the '(.*)' button$/) do |button_text|
  click button_text
end

Then(/^I expect to be redirected to '(.*):id'$/) do |path|
  expect(current_url.include? path).to be true
end

Then(/^my personal details are saved$/) do
  pending # express the regexp above with the code you wish you had << yeah right
  
end

def fill_in_valid_property(overides={})
  within('.property-details') do
    fill_in 'Street', with: overides[:street] || "102 Petty France"
    fill_in 'Town', with: overides[:town] || "Westminster"
    fill_in 'Postcode', with: overides[:post_code] || "SW1H 9AJ"
    check 'Residential'
    check 'Commercial'
    choose overides[:who_is_in_property] || 'Tenants'
    fill_in 'Title number', with: overides[:title_number] || "26736736"
  end
end

def fill_in_valid_landlord(overides={})
  within('.landlord-details') do
    fill_in 'Company name', with: overides[:company] || "Bristol County Council"
    fill_in 'Street', with: overides[:street] || "18 My Street"
    fill_in 'Town', with: overides[:town ] || "Bristol"
    fill_in 'Postcode', with: overides[:post_code] || "N3 3LLC"
    fill_in 'Title', with: overides[:title] || "Mr."
    fill_in 'Full name', with: overides[:full_name] || "Thomas Brown"
    fill_in 'Phone', with: overides[:phone] || "01 23727 3 262"
    fill_in 'Mobile', with: overides[:mobile] || "07 523 262 262"
    fill_in 'Email', with: overides[:email] || "housing@bristol.gov.uk"
    fill_in 'DX number', with: overides[:dx_number] || "3636"
    fill_in 'DX exchange', with: overides[:dx_exchange] || "Ex 3737"
  end
end

def fill_in_valid_tenant(overides={})
  fill_in 'Title', with: overides[:title] || "Miss"
  fill_in 'Full name', with: overides[:full_name] || "Catty Ashh"
  fill_in 'Phone', with: overides[:phone] || "01 111 111 111"
  fill_in 'Mobile', with: overides[:mobile] || "07 111 111 111"
  fill_in 'Email', with: overides[:email] || "cash@guilford.gov.uk"
  fill_in 'Street', with: overides[:street] || "183 Guilford Street"
  fill_in 'Town', with: overides[:town ] || "Guilford"
  fill_in 'Postcode', with: overides[:post_code] || "BS BS"
end