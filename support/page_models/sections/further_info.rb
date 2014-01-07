class EditableFurtherInformationSection < SitePrism::Section
  element :title, 'h3'

  element :further_info, "textarea#further-info"
  element :human_rights_act, ".human_rights_issues label"
end