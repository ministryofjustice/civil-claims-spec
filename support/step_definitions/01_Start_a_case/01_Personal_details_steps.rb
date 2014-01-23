When(/^I enter valid details for everything except (.*)$/) do |field|
  @app.repossession_claim.step_1.tenants.tenant { |tenant| tenant.send(field.to_sym).set "" }
end

Then(/^I expect to be on the same page$/) do
  expect(@app.repossession_claim.current_path).to eql "/claims/new"
end

Then(/^there to be an (.*) message$/) do |message|
  within(:css, ".error-summary") { page.should have_content message }
end

When(/^I am filling in (.*) with (\d+)$/) do |item, num|
  @app.repossession_claim.step_1.tenants.tenant do
    |tenant| tenant.send(item.to_sym).set ("x" * "num".to_i)
  end
end

Then(/^I expect to get a (\w+) with (.*)$/) do |status, message|
  if status == "fail"
    within(:css, ".error-summary") { page.should have_content message }
  end
end
