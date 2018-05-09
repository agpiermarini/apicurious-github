class ProfilesController < ApplicationController
  def show
    @profile = GithubUserService.new(params[:username], current_user.oauth_token).user

    render :plain => @profile[:message], :status => '404' if @profile[:message]
  end
end
