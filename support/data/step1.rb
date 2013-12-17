class Data
  def self.repossession_claim_landlord
    {
      organisation_name: 'Bristol City Council',
      full_name: 'Bob Hoskins',
      phone: '123456567',
      email: 'bob.hoskins@example.com'
    }
  end

  def self.repossession_claim_property_details
    {
      street: '102 Petty France',
      town: 'Westminster',
      postcode: 'SW1H 9AJ',
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