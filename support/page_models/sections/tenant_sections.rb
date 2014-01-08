class EditableTenantSection < SitePrism::Section
  element :title, '.title input'
  element :full_name, '.full_name input'
  element :phone, '.phone input'
  element :email, '.email input'
  element :street, '.street textarea'
  element :town, '.town input'
  element :postcode, '.postcode input'
end

class TenantSection < SitePrism::Section
  element :full_name, '.full_name .value'
  element :address, '.address .value'
  element :phone, '.phone .value'
  element :email, '.email .value'
end

class EditableTenantSectionGroup < SitePrism::Section
  element :title, 'h3'
  sections :tenant, EditableTenantSection, '.tenant-form'
end

class TenantSectionGroup < SitePrism::Section
  element :title, 'h3'
  sections :tenant, TenantSection, '.tenant'
end