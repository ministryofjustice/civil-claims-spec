class Data
  def self.repossession_claim_landlord
    {
      company: 'Bristol County Council',
      street: '18 My Street',
      town: 'Bristol',
      postcode: 'N3 3LLC',

      title: 'Mr',
      full_name: 'Thomas Brown',
      phone: '0919239872 34',
      mobile: '234234234234',
      email: 'my@example.com',

      dx_number: '123',
      dx_exchange: 'bristol'
    }
  end

  def self.repossession_claim_property_details
    {
      street: '102 Petty France',
      town: 'Westminster',
      postcode: 'SW1H 9AJ',
      residential: true,
      commercial:  true,
      who_is_in_property: 'tenants',
      title_number: '1231123123'
    }
  end

  def self.repossession_claim_tenant
    {
        street: '110 Example Lane',
        town: 'Bristol',
        postcode: 'BS112 1AC',

        title: 'Mr',
        full_name: 'Tenanty Tenant',
        phone: '01 111 111 111',
        mobile: '02222 222 2222',
        email: 'tenant@example.com'
    }
  end
end