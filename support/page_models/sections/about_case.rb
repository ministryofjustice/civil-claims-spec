class EditableAboutCaseSection < SitePrism::Section
  element :title, 'h3'

  element :notice_served_seeking_possession, ".notice_served input[value='notice seeking possession'] + label" # label is for clicking
  element :notice_served_possession_proceedings, ".tenancy_type input[value='notice of possession proceedings'] + label"
  element :notice_served_date_year, "#notice-served-date select.year"
  element :notice_served_date_month, "#notice-served-date select.month"
  element :notice_served_date_day, "#notice-served-date select.day"
  element :total_unpaid_rent, ".total_unpaid_rent input"
end