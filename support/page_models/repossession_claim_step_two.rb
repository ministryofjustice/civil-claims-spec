class RepossessionClaimStepTwo < SitePrism::Page
  set_url '/claims/{/id}/case_details'
  set_url_matcher /\/claims\/\d+\/case_details/

  section :about_the_tenancy,   EditableAboutTenancySection,        '#about-the-tenancy'
  section :about_the_case,      EditableAboutCaseSection,           '#about-the-case'
  section :further_information, EditableFurtherInformationSection,  '#further-information'

 
  def initialize(test_data)
    @data = test_data
  end

  def complete_form_with_valid_data
    d = @data.repossession_claim.about_tenancy

    choose d.tenancy_type
    select(d.tenancy_start_year, from: about_the_tenancy.tenancy_start_date_year[:id])
    select(d.tenancy_start_month, from: about_the_tenancy.tenancy_start_date_month[:id])  
    select(d.tenancy_start_day, from: about_the_tenancy.tenancy_start_date_day[:id])  
    about_the_tenancy.rent_amount.set d.rent_amount
    select(d.rent_frequency, from: about_the_tenancy.rent_payment_frequency[:id])
    about_the_tenancy.daily_rent_amount.set d.daily_rent_amount

    d = @data.repossession_claim.about_case

    choose d.notice_served
    select(d.notice_served_day, from: about_the_case.notice_served_date_day[:id])
    select(d.notice_served_month, from: about_the_case.notice_served_date_month[:id])
    select(d.notice_served_year, from: about_the_case.notice_served_date_year[:id])

    about_the_case.total_unpaid_rent.set d.total_unpaid_rent

    further_information.further_info.set @data.repossession_claim.additional.further_info
    further_information.human_rights_act.set ( @data.repossession_claim.additional.human_rights == 'yes' ? 1 : 0 )

  end
end
