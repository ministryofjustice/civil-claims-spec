class RepossessionClaimStepThree < SitePrism::Page
  include RSpec::Matchers

  set_url '/claims/{/id}/check_details'
  set_url_matcher /\/claims\/\d+\/check_details/

  section :property,      PropertySection,     '#property'
#  section :claimant,      LandlordSection,     '#claimant'
#  section :defendant,     TenantSection,       '#tenant'
#  section :about_tenancy, AboutTenancySection, '#about-tenancy'

  def initialize(test_data)
    @data = test_data
  end

  def expect_correct_details
    expect_correct_property_details
    expect_correct_claimant_details
    expect_correct_defendant_details
    expect_correct_tenancy_details
    expect_correct_case_details
    expect_correct_further_information
  end

  def expect_correct_property_details
    expect(property.address.text).to include @data.repossession_claim.property.street
    expect(property.address.text).to include @data.repossession_claim.property.town
    expect(property.address.text).to include @data.repossession_claim.property.postcode
  end

  def expect_correct_claimant_details
  end

  def expect_correct_defendant_details
  end

  def expect_correct_tenancy_details
  end

  def expect_correct_case_details
  end

  def expect_correct_further_information
  end

end
