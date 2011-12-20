class ProjectsController < ApplicationController

  def show
    personal_website = Github.new("edmore", "edmoremoyo", "master")
    @personal_message = personal_website.last_commit_message

    flickery = Github.new("edmore", "jFlickery", "master")
    @flickery_message = flickery.last_commit_message

    matterhorn = Github.new("edmore", "Matterhorn", "master")
    @matterhorn_message = matterhorn.last_commit_message

    sakai = Github.new("edmore", "Sakai", "master")
    @sakai_message = sakai.last_commit_message
  end

end
