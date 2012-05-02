class ProjectsController < ApplicationController

  def show
    personal_website = Github::Commit.new(:user => "edmore", :repo => "edmoremoyo", :branch => "master")
    @personal_message = personal_website.last_commit_message

    flickery = Github::Commit.new(:user => "edmore", :repo => "jFlickery", :branch => "master")
    @flickery_message = flickery.last_commit_message

    matterhorn = Github::Commit.new(:user => "edmore", :repo => "Matterhorn", :branch => "master")
    @matterhorn_message = matterhorn.last_commit_message

    sakai = Github::Commit.new(:user => "edmore", :repo => "Sakai", :branch => "master")
    @sakai_message = sakai.last_commit_message

    dexter = Github::Commit.new(:user => "edmore", :repo => "dexter", :branch => "master")
    @dexter_message = dexter.last_commit_message
  end

end
