class RepoSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def repos
    repo_info = repo_service.repos

    repo_info.map do | repo_info |
      Repository.new(repo_info)
    end
  end

  private
    attr_reader :username, :token

    def repo_service
      @repo_service ||= GithubRepoService.new(username, token)
    end
end
