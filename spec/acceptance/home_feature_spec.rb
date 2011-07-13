require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Home Feature", %q{
  In order to view the home page
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
    page.should have_css("h2", :text => "#projects")
  end

  scenario "I should see a blogs page" do
    visit homepage
    click_link("Thoughts in Bits")
    page.should have_css("h2", :text => "#blog_index")
  end

  scenario "I should see a contacts page" do
    visit homepage
    click_link("Get in Touch")
    page.should have_css("h2", :text => "#get_in_touch")
  end

end
