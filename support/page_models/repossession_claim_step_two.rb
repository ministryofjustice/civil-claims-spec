class RepossessionClaimStepTwo < SitePrism::Page
  set_url '/claims/{/id}/case_details'
  set_url_matcher /\/claims\/\d+\/case_details/

  section :about_the_tenancy, EditableAboutTenancySection, '#about-the-tenancy'
  #section :about_the_case, EditableAboutCaseSection, '#about-the-case'
 # section :further_information, EditableFurtherInformationSection, '#further-information'

 
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
    council.organisation_name.should eql @data.repossession_claim.landlord.organisation_name
    council.full_name.should         eql @data.repossession_claim.landlord.full_name
    council.phone.should             eql @data.repossession_claim.landlord.phone
    council.email.should             eql @data.repossession_claim.landlord.email
  end
end
