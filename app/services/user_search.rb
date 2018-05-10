class UserSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def profile
    user_info = user_service.user
    Profile.new(user_info)
  end

  private
    attr_reader :username, :token
    def user_service
      @user_service ||= GithubUserService.new(username, token)
    end
end
