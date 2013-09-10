class AdminController < ApplicationController
  def index
    #http://railscasts.com/episodes/250-authentication-from-scratch
     user = User.authenticate(params[:username],params[:password])

    if user
      redirect_to calendar_menu_url
    end
  end
  def logout
    #TODO logout user
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'You have been logged out'
    redirect_to(:action => 'index')
  end
end
