class RepossessionClaimStepFive < SitePrism::Page
  include RSpec::Matchers

  set_url '/claims/{/id}/confirmation'
  set_url_matcher /\/claims\/\d+\/confirmation/

  element :case_number, 'h2.case_number strong'

  def initialize(test_data)
    @data = test_data
  end

end
