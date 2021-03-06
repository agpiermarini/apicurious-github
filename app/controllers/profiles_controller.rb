class ProfilesController < ApplicationController
  def show
    @profile = UserSearch.new(params[:username], current_user.oauth_token).profile
    return render :plain => @profile.message, :status => '404' if @profile.message
    @push_events = PushEventSearch.new(params[:username], current_user.oauth_token).push_events
  end
end
