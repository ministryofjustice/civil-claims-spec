class RepossessionClaimStepThree < SitePrism::Page
  include RSpec::Matchers

  set_url '/claims/{/id}/check_details'
  set_url_matcher /\/claims\/\d+\/check_details/

  section :property,      PropertySection,            '#property'
  section :claimant,      LandlordSection,            '#claimant'
  section :tenants,       TenantSectionGroup,         '#tenants'
  section :tenancy,       AboutTenancySection,        '#about-tenancy'
  section :about_case,    AboutCaseSection,           '#about-case'
  section :additional,    FurtherInformationSection,  '#further-information'

  def initialize(test_data)
    @data = test_data
  end

  def expect_correct_details
    expect_correct_property_details
    expect_correct_claimant_details
    expect_correct_defendant_details
    expect_correct_tenancy_details
    expect_correct_case_details
    expect_correct_further_information
  end

  def expect_correct_property_details
    d = @data.repossession_claim.property
    expect(property.address.text).to        include     d.street
    expect(property.address.text).to        include     d.town
    expect(property.address.text).to        include     d.postcode
  end

  def expect_correct_claimant_details
    d = @data.repossession_claim.landlord
    expect(claimant.organisation_name.text).to  eql     d.organisation_name
  # expect(claimant.address.text).to            eql     d.address
    expect(claimant.full_name.text).to          include d.full_name
    expect(claimant.phone.text).to              eql     d.phone
    expect(claimant.email.text).to              eql     d.email

  end

  def expect_correct_defendant_details
    tenant = tenants.tenant[0] # only tests first tenant right now
    d = @data.repossession_claim.tenant
    expect(tenant.full_name.text).to    include     d.full_name
    expect(tenant.address.text).to      include     d.street
    expect(tenant.address.text).to      include     d.town
    expect(tenant.address.text).to      include     d.postcode
    expect(tenant.phone.text).to        eql         d.phone
    expect(tenant.email.text).to        eql         d.email
  end

  def expect_correct_tenancy_details
    d = @data.repossession_claim.about_tenancy
    expect(tenancy.tenancy_type.text).to          eql       d.tenancy_type
    start_date = "#{d.tenancy_start_day} #{d.tenancy_start_month} #{d.tenancy_start_year}"
    expect(tenancy.tenancy_start_date.text).to    eql       start_date
    expect(tenancy.rent_amount.text).to           include   d.rent_amount.to_s.gsub(/\.0*/, '')
    expect(tenancy.rent_amount.text).to           include   d.rent_frequency
    expect(tenancy.daily_rent_amount.text).to     include   d.daily_rent_amount.to_s.gsub(/\.0*/, '')
  end

  def expect_correct_case_details
    d = @data.repossession_claim.about_case
    expect(about_case.notice_served.text).to                      eql       d.notice_served
    notice_served_date = "#{d.notice_served_day} #{d.notice_served_month} #{d.notice_served_year}"
    expect(about_case.date_notice_served.text).to                 eql       notice_served_date
    expect(about_case.total_unpaid_rent.text.gsub(',','')).to     include   d.total_unpaid_rent.to_s.gsub(/\.0*/, '')
  end

  def expect_correct_further_information
    d = @data.repossession_claim.additional
    expect(additional.further_info.text).to     eql     d.further_info
  end

end
