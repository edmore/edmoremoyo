module Github
  require 'open-uri'
  @api_url = "https://api.github.com"

  class << self
    attr_accessor :api_url
  end

  class Commit
    attr_accessor :user, :repo, :branch

    def initialize( hash )
      hash.each do |key,value|
        instance_variable_set( "@#{key}", value )
      end
      @api = Github.api_url
    end

    def list_commits
      open_api("#{@api}/repos/#{@user}/#{@repo}/commits")
    end

    def commit(commit_id)
      open_api("#{@api}/repos/#{@user}/#{@repo}/commits/#{commit_id}")
    end

    def most_recent_message
      with_commits_list {|o| o.first["commit"]["message"] }
    end

    def most_recent_date
      with_commits_list do |o|
        Time.parse(o.first["commit"]["committer"]["date"]).strftime("%d %B %Y %I:%M%p")
      end
    end

    def most_recent_url
      with_commits_list { |o| o.first["commit"]["url"] }
    end

    def last_committer
      with_commits_list { |o| o.first["commit"]["committer"]["name"] }
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
