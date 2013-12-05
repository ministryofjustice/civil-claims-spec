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