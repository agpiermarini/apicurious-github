class Profile
  def initialize(name, token)
    @name = name
    @token = token
  end

  def information
    conn = Faraday.new "https://api.github.com/users/#{@name}"

    response = conn.get do |req|
      req.headers["Authorization"] = "token #{@token}"
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
