module NavigationHelpers
  # Put helper methods related to the paths in your application here.

  def homepage
    "/"
  end

  def admin_login
    "/admin"
  end

  def profile
    "/profile"
  end

  def projects
    "/projects"
  end

  def thoughts_in_bits
    "/posts/overview"
  end

  def posts_index
    "/posts"
  end

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
