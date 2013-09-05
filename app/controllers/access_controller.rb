class AccessController < ApplicationController

  layout 'application'
  before_filter :confirm_login, :only => [:calendar_menu]

  def index

  end

  def login_attempt
   redirect_to action: 'calendar_menu'
end

  def logout
  end

  def calendar_menu
    @calendar = Calendar.new
    @calendar._day = Date.today.day, @calendar._month = Date.today.month, @calendar._year =
    @calendar._today = Date.new(Date.today.year,Date.today.month,Date.today.day)
  end

  def confirm_login

  end

  def new_month
    @calendar = Calendar.new
    @calendar._day = Date.today._day, @calendar._month = params[:month].to_i,@calendar._year = params[:year].to_i
    @calendar._today = Date.new(@calendar._year,@calendar._month,@calendar._day)
    render (:new_month)
  end
end
