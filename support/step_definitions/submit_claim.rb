def fill_in_property(property_data)
  within('.property-details') do
    fill_in 'Street',       with: property_data[:street]
    fill_in 'Town',         with: property_data[:town]
    fill_in 'Postcode',     with: property_data[:postcode]
  end
end

def check_property_details(property_data)
  within('.property-details') do
    expect(find_field('Street').value).to eql property_data[:street]
    expect(find_field('Town').value).to eql property_data[:town]
    expect(find_field('Postcode').value).to eql property_data[:postcode]
  end
end

def fill_in_tenant(tenant_data)
  within('#tenant-0') do
    fill_in 'Title', with: tenant_data[:title]
    fill_in 'Full name', with: tenant_data[:full_name]
    fill_in 'Mobile', with: tenant_data[:mobile]
    fill_in 'Email', with: tenant_data[:email]
    fill_in 'Street', with: tenant_data[:street]
    fill_in 'Town', with: tenant_data[:town ]
    fill_in 'Postcode', with: tenant_data[:postcode]
  end
end

def check_tenant_details(tenant_data)
  within('#tenant-0') do
    expect(find_field('Title').value).to eql tenant_data[:title]
    expect(find_field('Full name').value).to eql tenant_data[:full_name]
    expect(find_field('Mobile').value).to eql tenant_data[:mobile]
    expect(find_field('Email').value).to eql tenant_data[:email]
    expect(find_field('Street').value).to eql tenant_data[:street]
    expect(find_field('Town').value).to eql tenant_data[:town ]
    expect(find_field('Postcode').value).to eql tenant_data[:postcode]
  end
end

def check_landlord_details(landlord_data)
  within('#council') do
    expect(page).to have_content(landlord_data[:organisation_name])
    expect(page).to have_content(landlord_data[:full_name])
    expect(page).to have_content(landlord_data[:phone])
    expect(page).to have_content(landlord_data[:email])
  end
end

def fill_in_case(case_data)
  within('#about-the-tenancy') do
    within('#tenancy-start-date') do
      find(:css, 'select.day').select(case_data[:tenancy_start_day])
      find(:css, 'select.month').select(case_data[:tenancy_start_month])
      find(:css, 'select.year').select(case_data[:tenancy_start_year])
    end
    fill_in 'Rent amount', with: case_data[:rent_amount]
    fill_in 'Daily rent amount', with: case_data[:daily_rent_amount]
  end
  within('#about-the-case') do
    choose('noticeserved-' + case_data[:notice_served])
    within('#notice-served-date') do
      find(:css, 'select.day').select(case_data[:notice_served_day])
      find(:css, 'select.month').select(case_data[:notice_served_month])
      find(:css, 'select.year').select(case_data[:notice_served_year])
    end
    fill_in 'Total unpaid rent', with: case_data[:total_unpaid_rent]
  end
  fill_in 'further-info', with: case_data[:further_info]
  check('human-rights')
end
