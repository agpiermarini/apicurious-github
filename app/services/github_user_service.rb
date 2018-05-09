class GithubUserService
  def initialize(name, token = nil)
    @name = name
    @token = token
  end

  def user
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def connection
      Faraday.new "https://api.github.com/users/#{@name}"
    end

    def response
      connection.get do |req|
        req.headers["Authorization"] = "token #{@token}"
      end
    end
end
