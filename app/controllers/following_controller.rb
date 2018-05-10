class FollowingController < ApplicationController
  def index
    @profile = UserSearch.new(params[:username], current_user.oauth_token).profile
    return render :plain => @profile.message, :status => '404' if @profile.message
    @following = FollowingSearch.new(params[:username], current_user.oauth_token).following
  end
end
