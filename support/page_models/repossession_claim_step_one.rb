class RepossessionClaimStepOne < SitePrism::Page
  set_url '/claims/{/id}/personal_details'
  set_url_matcher /\/claims\/\d+\/personal_details/

  section :property, EditablePropertySection, '#property'
  section :council, LandlordSection, '#council'
  section :tenants, EditableTenantsSection, '#tenant-details'
end

class EditablePropertySection < SitePrism::Section
  element :title, 'h3'
  element :street, 'textarea#claim_property_street'
  element :town, 'input#claim_property_town'
  element :postcode, 'input#claim_property_postcode'
end

class LandlordSection < SitePrism::Section
  element :title, 'h3'
  element :organisation_name, '.organisation_name .value'
  element :address, '.address .value'
  element :full_name, '.full_name .value'
  element :phone, '.phone .value'
  element :email, '.email .value'
end

class EditableTenantsSection < SitePrism::Section
  element :title, 'h3'
  sections :tenant, EditableTenantsSection, '.tenant-form'
end

class EditableTenantSection < SitePrism::Section
  element :title, '.title input'
  element :full_name, '.full_name input'
  element :mobile, '.mobile input'
  element :email, '.email input'
  element :street, '.street textarea'
  element :town, '.town input'
  element :postcode, '.postcode input'
end