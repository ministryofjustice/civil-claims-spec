class RepossessionClaimStepFour < SitePrism::Page
  include RSpec::Matchers

  set_url '/claims/{/id}/pay_court_fee'
  set_url_matcher /\/claims\/\d+\/pay_court_fee/

  def initialize(test_data)
    @data = test_data
  end

end
