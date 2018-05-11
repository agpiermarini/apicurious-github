class PushEvent
  attr_reader :created_at
  def initialize(push_event_info)
    @repo_info = push_event_info[:repo]
    @payload_info = push_event_info[:payload]
    @created_at = push_event_info[:created_at]
  end

  def repo_name
    repo_info[:name].split("/")[1]
  end

  def commits
    generate_commits
  end

  private
    attr_reader :repo_info, :payload_info

    def commit_info
      payload_info[:commits]
    end

    def truncate_sha(sha)
      sha[0..5]
    end

    def generate_commits
      commit_info.map do | commit |
        Commit.new({sha_partial:     truncate_sha(commit[:sha]),
                    message: commit[:message]
                    })
      end
    end
end
