class StarredSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def repo_count
    starred_service.starred_repo_info.count
  end

  def repos
    starred_repo_info = starred_service.starred_repo_info

    starred_repo_info.map do | repo_info |
      Repository.new(repo_info)
    end
  end

  private
  attr_reader :username, :token

  def starred_service
    @starred_service ||= GithubStarredService.new(username, token)
  end
end
