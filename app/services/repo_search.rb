class RepoSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def repositories
    connection = Faraday.new "https://api.github.com/users/#{username}/repos"

    response = connection.get do |req|
      req.headers["Authorization"] = "token #{token}"
    end

    raw_repos = JSON.parse(response.body, symbolize_names: true)

    raw_repos.map do | repo_info |
      Repository.new(repo_info)
    end
  end

  private
    attr_reader :username, :token

end
