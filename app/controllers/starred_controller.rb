class StarredController < ApplicationController
  def index
    @profile = UserSearch.new(params[:username], current_user.oauth_token).profile
    return render :plain => @profile.message, :status => '404' if @profile.message
    @repositories = StarredSearch.new(params[:username], current_user.oauth_token).repos
  end
end
