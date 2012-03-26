require 'spec_helper'

describe Github do

  before(:each) do
    @project = Github.new("user", "repo", "branch")
    @project.stub(:open_api).with("#{Github.api_url}/commits/list/#{@project.user_id}/#{@project.repo}/#{@project.branch}").and_return("{\"commits\":[{\"parents\":[{\"id\":\"3ed85a545cfa9ea25595925103c1af077e25274e\"}],\"author\":{\"name\":\"Edmore  Moyo\",\"login\":\"edmore\",\"email\":\"etmoyo@test.com\"},\"url\":\"/edmore/edmoremoyo/commit/1f78ea9669f9910829046d925a9d02757ea36522\",\"id\":\"1f78ea9669f9910829046d925a9d02757ea36522\",\"committed_date\":\"2011-06-28T01:18:03-07:00\",\"authored_date\":\"2011-06-28T01:18:03-07:00\",\"message\":\"More refactoring of Github API wrapper class\",\"tree\":\"002f5de7e919865670b64a4548954990a9c38b9e\",\"committer\":{\"name\":\"Edmore Moyo\",\"login\":\"edmore\",\"email\":\"etmoyo@test.com\"}}]}")
  end

  describe "#list_commits" do
    it "should return a list of commits" do
      @project.list_commits.should == "{\"commits\":[{\"parents\":[{\"id\":\"3ed85a545cfa9ea25595925103c1af077e25274e\"}],\"author\":{\"name\":\"Edmore  Moyo\",\"login\":\"edmore\",\"email\":\"etmoyo@test.com\"},\"url\":\"/edmore/edmoremoyo/commit/1f78ea9669f9910829046d925a9d02757ea36522\",\"id\":\"1f78ea9669f9910829046d925a9d02757ea36522\",\"committed_date\":\"2011-06-28T01:18:03-07:00\",\"authored_date\":\"2011-06-28T01:18:03-07:00\",\"message\":\"More refactoring of Github API wrapper class\",\"tree\":\"002f5de7e919865670b64a4548954990a9c38b9e\",\"committer\":{\"name\":\"Edmore Moyo\",\"login\":\"edmore\",\"email\":\"etmoyo@test.com\"}}]}"
    end

    it "should display a message when something goes wrong" do
      project = Github.new("user", "repo", "branch")

      project.stub(:open_api).with("#{Github.api_url}/commits/list/#{@project.user_id}/#{@project.repo}/#{@project.branch}").and_return("Oops!!, some http issues, sorry.")

      project.list_commits.should == "Oops!!, some http issues, sorry."
    end
  end

  describe "#last_commit_message" do
    it "should return the last commit message" do
      @project.last_commit_message.should == 'More refactoring of Github API wrapper class'
    end
  end

  describe "#last_commit_date" do
    it "should return the last commit date" do
      @project.last_commit_date.should == '28 June 2011 01:18AM'
    end
  end

  describe "#last_commit_url" do
    it "should return the last commit url" do
      @project.last_commit_url.should == '/edmore/edmoremoyo/commit/1f78ea9669f9910829046d925a9d02757ea36522'
    end
  end

  describe "#last_committer" do
    it "should return the last commiter" do
      @project.last_committer.should == 'Edmore Moyo'
    end
  end

  describe "#commits_on_file" do
    it "should return the commits for a particular file" do
      file_name = "test_file"
      @project.stub(:open_api).with("#{Github.api_url}/commits/list/#{@project.user_id}/#{@project.repo}/#{@project.branch}/#{file_name}").and_return("commits_on_file")
      @project.commits_on_file(file_name).should == "commits_on_file"
    end

    it "should display a message when something goes wrong" do
      file_name = "test_file"
      @project.stub(:open_api).with("#{Github.api_url}/commits/list/#{@project.user_id}/#{@project.repo}/#{@project.branch}/#{file_name}").and_return("Something went wrong")
      @project.commits_on_file(file_name).should == "Something went wrong"
    end
  end

  describe "#commit" do
    it "should return a particular commit" do
      id = "abcxyz"
      @project.stub(:open_api).with("#{Github.api_url}/commits/show/#{@project.user_id}/#{@project.repo}/#{id}").and_return("commit")
      @project.commit(id).should == "commit"
    end

    it "should display a message when something goes wrong" do
      id = "abcxyz"
      @project.stub(:open_api).with("#{Github.api_url}/commits/show/#{@project.user_id}/#{@project.repo}/#{id}").and_return("Something went very wrong")
      @project.commit(id).should == "Something went very wrong"
    end
  end

end
