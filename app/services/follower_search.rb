class FollowerSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def followers
    connection = Faraday.new "https://api.github.com/users/#{username}/followers"

    response = connection.get do | req |
      req.headers["Authorization"] = "token #{@token}"
    end

    follower_info = JSON.parse(response.body, symbolize_names: true)

    follower_info.map do | follower |
      UserSearch.new(follower[:login], ENV["github_token"]).profile
    end
  end

  private
  attr_reader :username, :token
end
