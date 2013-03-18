describe "User" do
  describe "GET /users/new" do
    it "should have a register form" do
      visit new_user_path
      page.should have_button("Create User")
    end
  end

  describe "POST /users" do
    it "should create a user" do
      visit new_user_path
      fill_in("user_email", :with => "jane@jane.com")
      fill_in("user_password", :with => "abc")
      fill_in("user_password_confirmation", :with => "abc")
      visit login_path
      fill_in("login_email", :with => "jane@jane.com")
      fill_in("login_password", :with => "abc")
      click_button("login_button")
      page.should have_text("Welcome to KickShips!")
    end
  end

  describe "GET /user/:id" do
    it "should have show page with name and donation table on it" do
      login_to_system
      click_link("janeliza")
      page.should have_text("janeliza")
      page.should have_text("Amount")
      page.should have_text("Date")
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