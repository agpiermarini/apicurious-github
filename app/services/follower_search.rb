class FollowerSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def followers
  end

  private
  attr_reader :username, :token
end
