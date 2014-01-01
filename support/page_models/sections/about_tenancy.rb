class EditableAboutTenancySection < SitePrism::Section
  element :title, 'h3'

  elements :tenancy_type_secure, ".tenancy_type input[value='secure tenancy']"
  elements :tenancy_type_introductory, ".tenancy_type input[value='introductory tenancy']"
  element :tenancy_start_date_year, ".date-picker select.year"
  element :tenancy_start_date_month, ".date-picker select.month"
  element :tenancy_start_date_day, ".date_picker select.day"
  element :rent_amount, ".rent_amount input.pound"
  element :rent_payment_frequency, ".rent_amount select"
  element :daily_rent_amount, ".daily_rent_amount"
end