class EditablePropertySection < SitePrism::Section
  element :title, 'h3'
  element :street, 'textarea#claim_property_street'
  element :town, 'input#claim_property_town'
  element :postcode, 'input#claim_property_postcode'
end