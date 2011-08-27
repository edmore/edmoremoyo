require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "About Feature", %q{
  In order to view the about page
  As a user
  I want to be able to view it
} do

  before(:each) do
    @profile = Factory.create(:profile)
  end

  scenario "I should see an about page" do
    visit about
  end

  scenario "I should see a link to the projects page" do
    visit homepage
    click_link("Projects")
    page.should have_css("h2", :text => "#projects")
  end

  scenario "I should see a link to the blogs page" do
    visit homepage
    click_link("Thoughts in Bits")
    page.should have_css("h2", :text => "#blog_index")
  end

  scenario "I should see a link to the contacts page" do
    visit homepage
    click_link("Get in Touch")
    page.should have_css("h2", :text => "#get_in_touch")
  end

end