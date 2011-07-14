require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Admin Feature", %q{
  In order to administer the website
  As an Admin
  I want to be able to administer it
} do

  before(:each) do
    @user = Factory.create(:user)
  end

  scenario "successfully logging in to the admin" do
    visit admin_login
    page.should have_css("h1", :text => "Admin")
    fill_in("Email", :with => @user.email)
    fill_in("Password", :with => @user.password)
    click_button("Sign in")
    page.should have_css("h1", :text => "Welcome to the Admin")
  end

  scenario "Updating the website profile" do
    profile = Factory.create(:profile)

    login_to_admin
    click_link("Profile")
    current_path.should == "/profile"

    page.should have_css("h2", :text => "Profile")
    fill_in("Summary", :with => "Web developer")
    fill_in("Skills", :with => "Ruby, HTML5, CSS#")
    fill_in("Education", :with => "NUST")
    fill_in("Experience", :with => "6 years")
    click_button("Update Profile")
    page.should have_css(".notice", :text => "Profile successfully updated")
  end

  scenario "display error if the profile fields are empty" do
    profile = Factory.create(:profile)

    login_to_admin
    click_link("Profile")
    current_path.should == "/profile"

    page.should have_css("h2", :text => "Profile")
    fill_in("Summary", :with => "")
    fill_in("Skills", :with => "")
    fill_in("Education", :with => "")
    fill_in("Experience", :with => "")
    click_button("Update Profile")
    page.should have_content("can't be blank")
    page.should have_css('.inline-errors', :count => 4)
  end

end
