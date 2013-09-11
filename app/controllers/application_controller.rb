class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def confirm_login
    unless session[:user_id]
      flash[:notice] = 'Please login'
      redirect_to root_url
      return false
    else
      return true
    end
  end

end
