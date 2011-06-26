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
    begin
    open("#{@api}/commits/list/#{@user_id}/#{@repo}/#{@branch}")
    rescue OpenURI::HTTPError
      error_message_http
    rescue SocketError
      error_message_socket
    rescue Timeout::Error
      error_message_timeout
    end
  end

  def last_commit_message
    begin
    parsed_json["commits"][0]["message"]
    rescue
      error_message
    end
  end

  def last_commit_date
    begin
    parsed_json["commits"][0]["committed_date"]
    rescue
      error_message
    end
  end

  def last_commit_url
    begin
    parsed_json["commits"][0]["url"]
    rescue
      error_message
    end
  end

  def last_committer
    begin
    parsed_json["commits"][0]["committer"]["name"]
    rescue
      error_message
    end
  end

  def commits_on_file(file_name)
    begin
    open("#{@api}/commits/list/#{@user_id}/#{@repo}/#{@branch}/#{file_name}")
    rescue OpenURI::HTTPError
      error_message_http
    rescue SocketError
      error_message_socket
    rescue Timeout::Error
      error_message_timeout
    end
  end

  def commit(commit_id)
    begin
    open("#{@api}/commits/show/#{@user_id}/#{@repo}/#{commit_id}")
    rescue OpenURI::HTTPError
      error_message_http
    rescue SocketError
      error_message_socket
    rescue Timeout::Error
      error_message_timeout
    end
  end

  private
  def parsed_json
    ActiveSupport::JSON.decode(list_commits.read)
  end

  def error_message
    "Oops, something went wrong!!"
  end

  def error_message_http
    "Oops!!, some http issues, sorry."
  end

  def error_message_socket
    "Oops!!, please check your internet connection."
  end

  def error_message_timeout
    "Oops!!, some timeout issues, sorry."
  end

end
