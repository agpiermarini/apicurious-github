class FollowingSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def following
    following_info = following_service.following

    following_info.map do | follower |
      UserSearch.new(follower[:login], ENV["github_token"]).profile
    end
  end

  private
  attr_reader :username, :token

  def following_service
    @following_service ||= GithubFollowingService.new(username, token)
  end
end
