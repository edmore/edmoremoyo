module HelperMethods
  # Put helper methods you need to be available in all tests here.
  def login_to_admin
    @user = Factory.create(:user)
    visit admin_login
    page.should have_css("h1", :text => "Admin")
    fill_in("Email", :with => @user.email)
    fill_in("Password", :with => @user.password)
    click_button("Sign in")
  end

  def should_have_table(selector, arr, parameterize = false)
    within selector do
      arr.each_with_index do |row, row_idx|
        row.each_with_index do |cell, cell_idx|
          text = cell
          text = text.parameterize("_") if (cell_idx + 1) % 2 == 1 && parameterize == true
          xpath = "tr[#{row_idx + 1}]/*[#{cell_idx + 1}]"
          elem = find(:xpath, xpath)
          "'#{elem.text.strip}' for element '#{xpath}'".should == text unless elem.text.strip == text.to_s.strip
        end
      end
    end
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
