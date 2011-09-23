class Github
  require 'open-uri'

  attr_accessor :user_id, :repo, :branch, :api

  def initialize(user, repo, branch, api = "http://github.com/api/v2/json")
    @user_id = user
    @repo = repo
    @branch = branch
    @api = api
  end

  def list_commits
    open_api("#{@api}/commits/list/#{@user_id}/#{@repo}/#{@branch}")
  end

  def commits_on_file(file_name)
    open_api("#{@api}/commits/list/#{@user_id}/#{@repo}/#{@branch}/#{file_name}")
  end

  def commit(commit_id)
    open_api("#{@api}/commits/show/#{@user_id}/#{@repo}/#{commit_id}")
  end

  def last_commit_message
    output = parsed_json(list_commits)
    output["commits"] ? output["commits"][0]["message"] : output
  end

  def last_commit_date
    output = parsed_json(list_commits)
    output["commits"] ? DateTime.parse(output["commits"][0]["committed_date"]).strftime("%d %B %Y %I:%M%p") : output
  end

  def last_commit_url
    output = parsed_json(list_commits)
    output["commits"] ? output["commits"][0]["url"] : output
  end

  def last_committer
    output = parsed_json(list_commits)
    output["commits"] ? output["commits"][0]["committer"]["name"] : output
  end

  private
  def open_api(url)
    begin
      open(url).read
    rescue OpenURI::HTTPError
      "Oops!!, some http issues, sorry."
    rescue SocketError
      "Oops!!, please check your internet connection."
    rescue Timeout::Error
      "Oops!!, some timeout issues, sorry."
    end
  end

  def parsed_json(api_data)
    return api_data unless api_data["commits"]
    ActiveSupport::JSON.decode(api_data)
  end
end
