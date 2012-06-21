class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :with_project

  def with_project(options = {})
    options.reverse_merge! :user => "edmore", :repo => "edmoremoyo", :branch => "master"
    g = Github::Commit.new(options)
    yield (g) if block_given?
  end
end
