class App
  def initialize(test_data)
    @data = test_data
  end

  def repossession_claim
    @repossession_claim ||= RepossessionClaim.new(@data)
  end
end