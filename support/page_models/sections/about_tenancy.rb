class EditableAboutTenancySection < SitePrism::Section
  element :title, 'h3'

  element :tenancy_type_secure, ".tenancy_type input[value='secure tenancy'] + label" # label is for clicking
  element :tenancy_type_introductory, ".tenancy_type input[value='introductory tenancy'] + label"
  element :tenancy_start_date_year, "#tenancy-start-date select.year"
  element :tenancy_start_date_month, "#tenancy-start-date select.month"
  element :tenancy_start_date_day, "#tenancy-start-date select.day"
  element :rent_amount, ".rent_amount input.pound"
  element :rent_payment_frequency, ".rent_amount select"
  element :daily_rent_amount, ".daily_rent_amount input.pound"
end

class AboutTenancySection < SitePrism::Section
  element :title,               'h3'
  element :tenancy_type,        '.tenancy_type .value'
  element :tenancy_start_date,  '.tenancy_start_date .value'
  element :rent_amount,         '.rent_amount .value'
  element :daily_rent_amount,   '.daily_rent_amount .value'
end