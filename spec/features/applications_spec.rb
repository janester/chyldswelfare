require "spec_helper"

describe "Applications" do
  describe "GET /applications" do
    it "should have button Apply" do
      login_to_system
      visit applications_path
      page.should have_link("Apply")
    end

    it "shows the new application form", :js => true do
      login_to_system
      visit applications_path
      click_link("app_page_btn")
      page.should have_button("Create Application")
    end

    # it "hide the form when cancel is pressed", :js => true do
    #   login_to_system
    #   visit applications_path
    #   click_link("Apply")
    #   click_button("Cancel")
    #   page.should_not have_button("Create application")
    # end
  end

  describe "POST /applications" do
    it "creates a new application and shows it in the list", :js => true do
      login_to_system
      visit applications_path
      click_link("app_page_btn")
      fill_in("application_tagline", :with => "a")
      fill_in("application_bio", :with => "b")
      fill_in("application_age", :with => "1")
      click_button("Create Application")
      page.should have_text("a")
      page.should have_text("b")
      page.should have_text("1")
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
