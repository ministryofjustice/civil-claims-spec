class EditableAboutDefendantSection < SitePrism::Section
  element :title, 'h3'
  element :about_defendant, "textarea#about-defendant"
end

class AboutDefendantSection < SitePrism::Section
  element :title, 'h3'
  element :about_defendant, '.value'
end