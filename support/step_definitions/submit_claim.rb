

def fill_in_property(property_data)
  within('.property-details') do
    fill_in 'Street',       with: property_data[:street]
    fill_in 'Town',         with: property_data[:town]
    # fill_in 'Postcode',     with: property_data[:postcode]
    # check 'Residential'     if property_data[:residential]
    # check 'Commercial'      if property_data[:commercial]
    # choose                  property_data[:who_is_in_property]
    # fill_in 'Title number', with: property_data[:title_number]
  end
end

def check_property_details(property_data)
  within('.property-details') do
    expect(find_field('Street').value).to eql property_data[:street]
  end
end

def fill_in_landlord(landlord_data)
  within('.landlord-details') do
    fill_in 'Company name', with: landlord_data[:company]
    fill_in 'Street', with: landlord_data[:street]
    fill_in 'Town', with: landlord_data[:town ]
    fill_in 'Postcode', with: landlord_data[:post_code]
    fill_in 'Title', with: landlord_data[:title]
    fill_in 'Full name', with: landlord_data[:full_name]
    fill_in 'Phone', with: landlord_data[:phone]
    fill_in 'Mobile', with: landlord_data[:mobile]
    fill_in 'Email', with: landlord_data[:email]
    fill_in 'DX number', with: landlord_data[:dx_number]
    fill_in 'DX exchange', with: landlord_data[:dx_exchange]
  end
end

def fill_in_tenant(tenant_data)
  within('#tenant-1') do
    fill_in 'Title', with: tenant_data[:title]
    fill_in 'Full name', with: tenant_data[:full_name]
    fill_in 'Phone', with: tenant_data[:phone]
    fill_in 'Mobile', with: tenant_data[:mobile]
    fill_in 'Email', with: tenant_data[:email]
    fill_in 'Street', with: tenant_data[:street]
    fill_in 'Town', with: tenant_data[:town ]
    fill_in 'Postcode', with: tenant_data[:post_code]
  end
end