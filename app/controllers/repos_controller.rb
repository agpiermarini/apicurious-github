class ReposController < ApplicationController
  def index
    @profile = UserSearch.new(params[:username], current_user.oauth_token).profile

    @repositories = RepoSearch.new(params[:username], current_user.oauth_token).repositories
  end
end
