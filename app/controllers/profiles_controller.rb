class ProfilesController < ApplicationController
  def show
    @profile = Profile.new(params[:username], current_user.oauth_token).information

    render :plain => @profile[:message], :status => '404' if @profile[:message]
  end
end
