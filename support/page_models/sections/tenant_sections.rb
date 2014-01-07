class EditableTenantSection < SitePrism::Section
  element :title, '.title input'
  element :full_name, '.full_name input'
  element :mobile, '.mobile input'
  element :email, '.email input'
  element :street, '.street textarea'
  element :town, '.town input'
  element :postcode, '.postcode input'
end

class EditableTenantSectionGroup < SitePrism::Section
  element :title, 'h3'
  sections :tenant, EditableTenantSection, '.tenant-form'
end