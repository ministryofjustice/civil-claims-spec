class App
  def repossession_claim
    @repossession_claim ||= RepossessionClaim.new
  end
end