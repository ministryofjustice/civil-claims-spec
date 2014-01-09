class EditableAboutClaimantSection < SitePrism::Section
  element :title, 'h3'
  element :about_claimant, "textarea#about-claimant"
end

class AboutClaimantSection < SitePrism::Section
  element :title, 'h3'
  element :about_claimant, '.value'
end