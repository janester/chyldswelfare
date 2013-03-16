require "spec_helper"

describe "Donations" do
  describe "GET /donations" do
    # it "lists all the donations" do
    #   visit donations_path
    #   user = User.create(name:"jane")
    #   donation = Donation.create(amount:1000)
    #   user.donations << donation
    #   page.should have_text(user.name)
    #   page.should have_text("1000.0")
    # end

    it "should have button Donate" do
      visit donations_path
      page.should have_link("Donate")
    end
  end
end
