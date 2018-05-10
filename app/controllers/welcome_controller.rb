class WelcomeController < ApplicationController
  def index
    redirect_to "/#{current_user.username}" if current_user
  end
end
