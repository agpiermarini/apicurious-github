class Commit
  attr_reader :sha_partial, :message
  def initialize(commit_info)
    @sha_partial = commit_info[:sha_partial]
    @message = commit_info[:message]
  end
end
