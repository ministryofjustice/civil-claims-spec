class RepossessionClaimStepOne < SitePrism::Page
  set_url '/claims/{/id}/personal_details'
  set_url_matcher /\/claims\/\d+\/personal_details/

  section :property, EditablePropertySection, '#property'
  section :council, LandlordSection, '#council'
  sections :tenants, EditableTenantsSections, '#tenant-details .tenant-form'

  def complete_form_with_valid_data
    property.street.set Data.repossession_claim.property.street
    property.town.set Data.repossession_claim.property.town
    property.postcode.set Data.repossession_claim.property.postcode

    tenants.each do |tenant|
      tenant.title.set Data.repossession_claim.tenant.title
      tenant.full_name.set Data.repossession_claim.tenant.full_name
      tenant.phone.set Data.repossession_claim.tenant.phone
      tenant.email.set Data.repossession_claim.tenant.email
      tenant.street.set Data.repossession_claim.tenant.street
      tenant.town.set Data.repossession_claim.tenant.town
      tenant.postcode.set Data.repossession_claim.tenant.postcode
    end
  end

  def expect_correct_business_details
    council.organisation_name.should eql Data.repossession_claim.landlord.organisation_name
    council.full_name.should eql Data.repossession_claim.landlord.full_name
    council.phone.should eql Data.repossession_claim.landlord.phone
    council.email.should eql Data.repossession_claim.landlord.email
  end
end
