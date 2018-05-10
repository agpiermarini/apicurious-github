class StarredSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def repos
    connection = Faraday.new "https://api.github.com/users/#{username}/starred"

    response = connection.get do | req |
      req.headers["Authorization"] = "token #{token}"
    end

    starred_info = JSON.parse(response.body, symbolize_names: true)

    starred_info.map do | repo_info |
      Repository.new(repo_info)
    end
  end

  private
  attr_reader :username, :token
end
