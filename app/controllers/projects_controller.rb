class ProjectsController < ApplicationController

  def show
    personal_website = Github::Commit.new("edmore", "edmoremoyo", "master")
    @personal_message = personal_website.last_commit_message

    flickery = Github::Commit.new("edmore", "jFlickery", "master")
    @flickery_message = flickery.last_commit_message

    matterhorn = Github::Commit.new("edmore", "Matterhorn", "master")
    @matterhorn_message = matterhorn.last_commit_message

    sakai = Github::Commit.new("edmore", "Sakai", "master")
    @sakai_message = sakai.last_commit_message

    dexter = Github::Commit.new("edmore", "dexter", "master")
    @dexter_message = dexter.last_commit_message
  end

end
