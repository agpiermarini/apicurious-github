class FollowerSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def followers
    follower_info = follower_service.followers

    follower_info.map do | follower |
      UserSearch.new(follower[:login], ENV["github_token"]).profile
    end
  end

  private
  attr_reader :username, :token

  def follower_service
    @follower_service ||= GithubFollowerService.new(username, token)
  end
end
