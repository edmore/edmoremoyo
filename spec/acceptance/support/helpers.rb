module HelperMethods
  # Put helper methods you need to be available in all tests here.
  def login_to_admin
    @user = Factory.create(:user)
    visit admin_login
    page.should have_css("h1", :text => "Sign in")
    fill_in("Email", :with => @user.email)
    fill_in("Password", :with => @user.password)
    click_button("Sign in")
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
