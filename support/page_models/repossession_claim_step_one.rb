class RepossessionClaimStepOne < SitePrism::Page
  include RSpec::Matchers

  set_url '/claims/{/id}/personal_details'
  set_url_matcher /\/claims\/\d+\/personal_details/

  section :property, EditablePropertySection, '#property'
  section :council, LandlordSection, '#council'
  sections :tenants, EditableTenantsSections, '#tenant-details .tenant-form'

  
  def initialize(test_data)
    @data = test_data
  end

  def complete_form_with_valid_data
    property.street.set     @data.repossession_claim.property.street
    property.town.set       @data.repossession_claim.property.town
    property.postcode.set   @data.repossession_claim.property.postcode

    tenants.each do |tenant|
      tenant.title.set      @data.repossession_claim.tenant.title
      tenant.full_name.set  @data.repossession_claim.tenant.full_name
      tenant.phone.set      @data.repossession_claim.tenant.phone
      tenant.email.set      @data.repossession_claim.tenant.email
      tenant.street.set     @data.repossession_claim.tenant.street
      tenant.town.set       @data.repossession_claim.tenant.town
      tenant.postcode.set   @data.repossession_claim.tenant.postcode
    end
  end

  def expect_correct_business_details
    expect(council.organisation_name.text).to eql @data.repossession_claim.landlord.organisation_name
    expect(council.full_name.text).to         eql @data.repossession_claim.landlord.full_name
    expect(council.phone.text).to             eql @data.repossession_claim.landlord.phone
    expect(council.email.text).to             eql @data.repossession_claim.landlord.email
  end
end
