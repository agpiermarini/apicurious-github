class GithubStarredService
  def initialize(username, token)
    @username = username
    @token = token
  end

  def starred_repo_info
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :username, :token
    def connection
      Faraday.new "https://api.github.com/users/#{username}/starred?sort=updated"
    end

    def response
      connection.get do | req |
        req.headers["Authorization"] = "token #{token}"
      end
    end
end
