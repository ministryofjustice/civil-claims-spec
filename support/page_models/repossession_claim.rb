class RepossessionClaim < SitePrism::Page
  set_url '/claims/new'

  def initialize(test_data)
    @data = test_data
  end

  def step_1
    @step_one ||= RepossessionClaimStepOne.new(@data)
  end

  def step_2
    @step_two ||= RepossessionClaimStepTwo.new(@data)
  end
end