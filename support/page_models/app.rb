class App
  include Capybara::DSL

  def initialize(test_data)
    @data = test_data
  end

  def repossession_claim
    @repossession_claim ||= RepossessionClaim.new(@data)
  end

  def login(profile)
    visit '/login'
    fill_in "Full name", with: @data.credentials[profile].username
    fill_in 'Password', with: @data.credentials[profile].password
    click_button 'Sign in'
  end
end