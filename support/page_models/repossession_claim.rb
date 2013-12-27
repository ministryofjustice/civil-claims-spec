class RepossessionClaim < SitePrism::Page
  set_url '/claims/new'

  def step_1
    @step_one ||= RepossessionClaimStepOne.new
  end

  def step_2
    @step_two ||= RepossessionClaimStepTwo.new
  end
end