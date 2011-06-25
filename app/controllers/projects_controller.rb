class ProjectsController < ApplicationController

  def show
    personal_website = Github.new("edmore", "edmoremoyo", "master")
    @message = personal_website.last_commit_message
  end

end
