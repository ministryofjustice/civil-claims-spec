class RepossessionClaim < SitePrism::Page
  set_url '/claims/landing'
  set_url_matcher /\/claims\/landing/

  attr_accessor :id

  section :page_header, PageHeaderSection, "#user-nav" 

  def initialize(test_data)
    @data = test_data
  end

  def set_id
    /(\d+)/.match(current_path) { |m| @id = m[1] }
  end

  def step_1
    @step_one ||= RepossessionClaimStepOne.new(@data)
  end

  def step_2
    @step_two ||= RepossessionClaimStepTwo.new(@data)
  end

  def step_3
    @step_3 ||= RepossessionClaimStepThree.new(@data)
  end
end