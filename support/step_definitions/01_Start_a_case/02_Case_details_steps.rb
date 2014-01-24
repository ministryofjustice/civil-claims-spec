When(/^I am filling in the claim details (.*)$/) do |item|
  if item =~ /^total/
    @item = @app.repossession_claim.step_2.about_the_case.send(item.gsub(' ', '_').to_sym)
  else
    @item = @app.repossession_claim.step_2.about_the_tenancy.send(item.gsub(' ', '_').to_sym)
  end
end

When(/^I enter the (\w+)$/) do |text|
  @item.set text
end

Then(/^I expect it to (\w+) for (.*)$/) do |status, item|
  if status == "fail"
    name = item.gsub(' ', '_')
    id = "#claim_case_detail_#{name}"
    within(:css, id) do
      within(:css, ".error") do
        page.should have_content "Error text here"
      end
    end
  else
    page.should_not have_content "Error text here"
  end
end

Then(/^return the (.*)$/) do |message|
  within(:css, ".error-summary") { page.should have_content message }
end

When(/^I continue to Step 2$/) do
  step "I click the 'Continue to next step' button"
end
