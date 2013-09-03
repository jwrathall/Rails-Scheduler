class AdminController < ApplicationController
  def index
    render(:text => 'login')
  end
  def logout
    #TODO logout user
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'You have been logged out'
    redirect_to(:action => 'index')
  end
end
