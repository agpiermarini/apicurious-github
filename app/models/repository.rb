class Repository
  attr_reader :name, :description, :forks, :updated_at, :html_url, :message, :language
  def initialize(repo_info)
    @name = repo_info[:name]
    @description = repo_info[:description]
    @forks = repo_info[:forks]
    @updated_at = repo_info[:updated_at]
    @html_url = repo_info[:html_url]
    @language = repo_info[:language]
    @message = repo_info[:message]
  end
end
