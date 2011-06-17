require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Blog Feature", %q{
  In order to view the blog
  As a user
  I want to be able to view it
} do

  before(:each) do
    @post1 = Factory.create(:post, :title => "The test blog", :body => "The blog body")
    @post2 = Factory.create(:post, :title => "The test blog 2", :body => "The blog body 2")
  end

  scenario "I should see a blog overview page" do
    visit thoughts_in_bits
    page.should have_css("h2", :text => "#my_blog_index")
    page.should have_css("article#blog_#{@post1.id} header>h3>a", :text => "The test blog")
    page.should have_css("article#blog_#{@post1.id} p", :text => "The blog body")
    page.should have_css("article#blog_#{@post1.id} footer", :text => @post1.created_at.strftime("%d-%m-%Y"))
  end

  scenario "I should see a particular blog" do
    visit thoughts_in_bits
    click_link("The test blog")
    page.should have_css("h2", :text => "The test blog")
    page.should have_css("article#post_#{@post1.id} p", :text => "The blog body")
  end

  scenario "creating a post" do
    login_to_admin
    click_link("Add Blog Article")
    page.should have_css("h2", :text => "Add Blog")
    fill_in("Title", :with => "Ruby + steak rocks")
    fill_in("Body", :with => "..and this is the reason why")
    click_button("Create Post")

    page.should have_content("Post successfully created.")
  end

end
