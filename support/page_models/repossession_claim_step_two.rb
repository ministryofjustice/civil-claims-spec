class RepossessionClaimStepTwo < SitePrism::Page
  set_url '/claims/{/id}/case_details'
  set_url_matcher /\/claims\/\d+\/case_details/

  section :about_the_tenancy,   EditableAboutTenancySection,        '#about-the-tenancy'
  section :about_the_case,      EditableAboutCaseSection,           '#about-the-case'
  section :further_information, EditableFurtherInformationSection,  '#further-information'
  section :recovery,            EditableRecoveryStepsSection,       '#recovery-steps-section'
  section :about_the_defendant, EditableAboutDefendantSection,      '#about-defendant-section'
  section :about_the_claimant,  EditableAboutClaimantSection,       '#about-claimant-section'

 
  def initialize(test_data)
    @data = test_data
  end

  def complete_form_with_valid_data
    complete_about_tenancy_form_section
    complete_about_case_form_section
  end

private
  
  def complete_about_tenancy_form_section
    d = @data.repossession_claim.about_tenancy

    choose d.tenancy_type
    select(d.tenancy_start_year, from: about_the_tenancy.tenancy_start_date_year[:id])
    select(d.tenancy_start_month, from: about_the_tenancy.tenancy_start_date_month[:id])  
    select(d.tenancy_start_day, from: about_the_tenancy.tenancy_start_date_day[:id])  
    about_the_tenancy.rent_amount.set d.rent_amount
    select(d.rent_frequency, from: about_the_tenancy.rent_payment_frequency[:id])
    about_the_tenancy.daily_rent_amount.set d.daily_rent_amount
  end

  def complete_about_case_form_section
    d = @data.repossession_claim.about_case

    choose d.notice_served
    select(d.notice_served_day, from: about_the_case.notice_served_date_day[:id])
    select(d.notice_served_month, from: about_the_case.notice_served_date_month[:id])
    select(d.notice_served_year, from: about_the_case.notice_served_date_year[:id])

    about_the_case.total_unpaid_rent.set d.total_unpaid_rent

    further_information.further_info.set @data.repossession_claim.additional.further_info
    further_information.human_rights_act.set ( @data.repossession_claim.additional.human_rights == 'yes' ? 1 : 0 )

    recovery.recovery_steps.set @data.repossession_claim.additional.recovery_steps
    about_the_defendant.about_defendant.set @data.repossession_claim.additional.about_defendant
    about_the_claimant.about_claimant.set @data.repossession_claim.additional.about_claimant
  end
end
