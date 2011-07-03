require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Contact Feature", %q{
  In order to get in touch
  As a user
  I want to be able to get in touch
} do

  scenario "succesfully submitting information into the contact form" do
    visit contact_page
    current_path.should == "/get_in_touch"
    fill_in("contact[name]", :with => "Edmore Moyo")
    fill_in("contact[email]", :with => "etmoyo@test.com")
    fill_in("contact[body]", :with => "I would like to a website created....")
    click_button("Send")
    page.should have_content("Message sent, I will get in touch with you shortly.")
  end

  scenario "viewing an index of contact information" do
    contact1 = Factory.create(:contact)
    contact2 = Factory.create(:contact)
    login_to_admin
    click_link("Contact Info")
    should_have_table('table.entries tbody',[
      [contact1.name, contact1.date_to_string],
      [contact2.name, contact2.date_to_string]
                                         ] )
  end

  scenario "viewing particular contact info " do
    contact1 = Factory.create(:contact, :created_at => 1.day.ago, :name => "bonnie")
    contact2 = Factory.create(:contact, :name => "clyde")
    login_to_admin
    click_link("Contact Info")
    within('.entries tbody tr:nth-child(2)') do
     click_link("View")
    end
    page.should have_css("#contact_name")
    page.should have_css("#contact_email")
    page.should have_css("#contact_body")
  end

end
