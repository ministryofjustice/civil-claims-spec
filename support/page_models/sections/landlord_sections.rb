class LandlordSection < SitePrism::Section
  element :title, 'h3'
  element :organisation_name, '.organisation_name .value'
  element :address, '.address .value'
  element :full_name, '.full_name .value'
  element :phone, '.phone .value'
  element :email, '.email .value'
end