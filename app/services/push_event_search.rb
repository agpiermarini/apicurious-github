class PushEventSearch
  def initialize(username, token)
    @username = username
    @token = token
  end

  def push_events
    connection = Faraday.new "https://api.github.com/users/#{username}/events"

    response = connection.get do | req |
      req.headers["Authorization"] = "token #{token}"
    end

    push_event_info = JSON.parse(response.body, symbolize_names: true)

    push_event_info.map do | event_info |
      PushEvent.new(event_info) if event_info[:type] == "PushEvent"
    end.compact
  end

  private
  attr_reader :username, :token
end
