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
      login_to_system
      visit donations_path
      page.should have_link("Donate")
    end

    it "shows the new donation form", :js => true do
      login_to_system
      visit donations_path
      click_link("Donate")
      page.should have_button("Create Donation")
    end

    it "hide the form when cancel is pressed", :js => true do
      login_to_system
      visit donations_path
      click_link("Donate")
      click_button("Cancel")
      page.should_not have_button("Create Donation")
    end
  end

  describe "POST /donations" do
    it "creates a new donation and shows it in the list", :js => true do
      login_to_system
      visit donations_path
      click_link("Donate")
      fill_in("Amount", :with => 100)
    end
  end
end

def login_to_system
  user = User.create(email:"jane@jane.com", name:"janeliza", password:"abc", password_confirmation:"abc")
  visit login_path
  fill_in("login_email", :with => user.email)
  fill_in("login_password", :with => "abc")
  click_button("login_button")
end
