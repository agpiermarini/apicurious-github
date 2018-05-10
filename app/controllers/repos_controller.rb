class ReposController < ApplicationController
  def index
    @profile = UserSearch.new(params[:username], current_user.oauth_token).profile

    # @repositories = RepositorySearch.new(params[:username], current_user.oauth_token)
  end
end
