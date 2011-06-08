class HomeController < ApplicationController
  before_filter :load_profile

  def index
  end

  private
  def load_profile
    @profile = Profile.first
  end

end
