class Profile
  attr_reader :username,
              :name,
              :bio,
              :avatar_url,
              :location,
              :company,
              :email,
              :repo_quantity,
              :followers_quantity,
              :following_quantity,
              :message

  def initialize(profile_info)
    @username = profile_info[:login]
    @name = profile_info[:name]
    @bio = profile_info[:bio]
    @avatar_url = profile_info[:avatar_url]
    @location = profile_info[:location]
    @company = profile_info[:company]
    @email = profile_info[:email]
    @repo_quantity = profile_info[:public_repos]
    @followers_quantity = profile_info[:followers]
    @following_quantity = profile_info[:following]
    @message = profile_info[:message]
  end

  def starred_count(username, token)
    @starred_cout ||= StarredSearch.new(username, token).repo_count
  end
end
