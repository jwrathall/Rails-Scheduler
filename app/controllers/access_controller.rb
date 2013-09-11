class AccessController < ApplicationController

  layout 'application'
  before_filter :confirm_login, :only => [:calendar_menu]

  def index

  end

  def login_attempt
    user = User.authenticate(params[:username],params[:password])

    if user
      session[:user_id] = user.id
      redirect_to action: 'calendar_menu'
    else
      redirect_to action: 'index'
    end

end

  def logout
  end

  def calendar_menu
    @calendar = Calendar.new(:_day => Date.today.day, :_month => Date.today.month, :_year => Date.today.year)
    @calendar._today = Date.new(Date.today.year,Date.today.month,Date.today.day)
  end

  def new_month
    @calendar = Calendar.new(:_day => Date.today.day, :_month => params[:month].to_i, :_year => params[:year].to_i)
    @calendar._today = Date.new(params[:year].to_i,params[:month].to_i,Date.today.day)
    #render (:new_month)
  end
end
