class ProjectsController < ApplicationController

  def show
    @personal_message = with_project {|g| g.last_commit_message }
    @flickery_message = with_project(:repo => "jFlickery") {|g| g.last_commit_message }
    @matterhorn_message = with_project(:repo => "Matterhorn") {|g| g.last_commit_message }
    @sakai_message = with_project(:repo => "Sakai") {|g| g.last_commit_message }
    @dexter_message = with_project(:repo => "dexter") {|g| g.last_commit_message }
    @peekaboo_message = with_project(:repo => "peekaboo") {|g| g.last_commit_message }
  end

end
