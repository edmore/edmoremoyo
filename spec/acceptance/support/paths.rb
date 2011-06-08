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

end

RSpec.configuration.include NavigationHelpers, :type => :acceptance
