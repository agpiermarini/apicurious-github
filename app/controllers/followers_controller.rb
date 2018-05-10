class FollowersController < ApplicationController
  def index
    @profile = UserSearch.new(params[:username], current_user.oauth_token).profile
    return render :plain => @profile.message, :status => '404' if @profile.message
    @followers = FollowerSearch.new(params[:username], current_user.oauth_token).followers
  end
end
