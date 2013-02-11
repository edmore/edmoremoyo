require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Blog Feature", %q{
  In order to view the blog
  As a user
  I want to be able to view it
} do


  scenario "displays message when there are no posts" do
    visit thoughts
    page.should have_content("Sorry no posts present at this time.")
  end

  scenario "I should see a blog overview page" do
    post1 = FactoryGirl.create(:post, :title => "The test blog", :body => "The blog body")
    post2 = FactoryGirl.create(:post, :title => "The test blog 2", :body => "The blog body 2", :created_at => Time.current + 1.day)

    visit thoughts
    page.should have_css("h2", :text => "posts")
    page.should have_css("article#blog_#{post1.id} header>h3>a", :text => "The test blog")
    page.should have_css("article#blog_#{post1.id} footer", :text => post1.date_to_readable)
  end

  scenario "I should see a particular blog post" do
    post1 = FactoryGirl.create(:post, :title => "The test blog", :body => "The blog body")
    post2 = FactoryGirl.create(:post, :title => "The test blog 2", :body => "The blog body 2", :created_at => Time.current + 1.day)
    visit thoughts
    find('a[title="The test blog"]').click
    page.should have_css("h2", :text => "The test blog")
    page.should have_css(".post header p", :text => "# #{post1.date_to_readable}" )
    page.should have_css("article#post_#{post1.id} p", :text => "The blog body")
  end

  scenario "viewing an index of blog posts" do
    post1 = FactoryGirl.create(:post, :title => "The test blog", :body => "The blog body")
    post2 = FactoryGirl.create(:post, :title => "The test blog 2", :body => "The blog body 2", :created_at => Time.current + 1.day)

    login_to_admin
    click_link("Blogs")
    page.should have_css("h2", :text => "Blogs")

    should_have_table('table.entries tbody',[

      ['The test blog 2', post2.date_to_string],
      ['The test blog', post1.date_to_string]
                                         ] )
  end

  scenario "navigating back to blog index" do
    post1 = FactoryGirl.create(:post, :title => "The test blog", :body => "The blog body")
    visit thoughts
    click_link("The test blog")
    current_path.should == "/blog/#{post1.title.parameterize}"
    click_link("Back to Index")
    page.current_path.should == "/blog"

  end

  scenario "creating a post" do
    login_to_admin
    visit posts_index
    click_link("Add")
    page.should have_css("h2", :text => "Add Blog")
    fill_in("Title", :with => "Ruby + steak rocks")
    fill_in("Body", :with => "..and this is the reason why")
    click_button("Create Post")

    page.should have_content("Post successfully created.")
  end

  scenario "editing a post" do
    post1 = FactoryGirl.create(:post, :title => "The test blog", :body => "The blog body")
    post2 = FactoryGirl.create(:post, :title => "The test blog 2", :body => "The blog body 2", :created_at => Time.current + 1.day)
    login_to_admin
    visit posts_index
    within(".entries tbody tr:nth-child(2)") do
      click_link("Edit")
    end
    page.should have_css("h2", :text => "Edit Blog")
    fill_in("Title", :with => "Edited title")
    click_button("Update Post")

    page.should have_content("Post successfully updated.")
    should_have_table('table.entries tbody',[

      ['The test blog 2', post2.date_to_string],
      ['Edited title', post1.date_to_string]
                                         ] )
  end

end
