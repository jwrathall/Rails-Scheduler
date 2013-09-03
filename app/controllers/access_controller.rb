class AccessController < ApplicationController
  require 'Calendar'
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
    @calendar = Calendar.new({:day => Date.today.day, :month => Date.today.month, :year => Date.today.year})
  end

  def confirm_login

  end

  def new_month
    @month = params[:month].to_i
    @year= params[:year].to_i
    @day = Date.today.day
    @calendar = Calendar.new({:day => @day, :month => @month, :year => @year})
    render (:new_month)
  end
end
