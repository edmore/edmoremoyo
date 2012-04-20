module Github
  require 'open-uri'
  @api_url = "http://github.com/api/v2/json"

  class << self
    attr_accessor :api_url
  end

  class Commit
    attr_accessor :user_id, :repo, :branch

    def initialize(user, repo, branch)
      @user_id = user
      @repo = repo
      @branch = branch
      @api = Github.api_url
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
      with_commits_list { |o| o["commits"] ? o["commits"][0]["message"] : o }
    end

    def last_commit_date
      with_commits_list do |o|
	o["commits"] ? DateTime.parse(o["commits"][0]["committed_date"]).strftime("%d %B %Y %I:%M%p") : o
      end
    end

    def last_commit_url
      with_commits_list { |o| o["commits"] ? o["commits"][0]["url"] : o }
    end

    def last_committer
      with_commits_list { |o| o["commits"] ? o["commits"][0]["committer"]["name"] : o }
    end

    private
    def with_commits_list
      o = parsed_json(list_commits)
      yield ( o ) if block_given?
    end

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
      begin
	ActiveSupport::JSON.decode(api_data)
      rescue
	api_data
      end
    end
  end

end
