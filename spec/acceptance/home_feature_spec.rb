require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Home Feature", %q{
  In order to view the website
  As a user
  I want to be able to view it
} do

  before(:each) do
    @profile = Factory.create(:profile)
  end

  scenario "I should see a home page" do
    visit homepage
  end

  scenario "I should see a projects page" do
    visit homepage
    click_link("Projects")
    page.should have_css("h2", :text => "#my_web_footprint")
  end

end
