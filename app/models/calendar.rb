class Calendar < ActiveRecord::Base
  has_many :users
  # attr_accessible :title, :body
  require 'date'
  require 'time'
  attr_accessor  :_year, :_month, :_day, :_today

  def days_in_month
   get_days_in_months(_year, _month)
  end
  def get_days_in_months(year, month)
    Time::days_in_month(month, year)
  end
  def start_of_week
    _today.beginning_of_week(:sunday)
  end
  def end_of_week
    _today.end_of_week(:sunday)
  end
  def start_of_previous_week
    (_today-7).beginning_of_week(:sunday)
  end
  def start_of_next_week
    (_today + 7).beginning_of_week(:sunday)
  end
  def end_of_next_week
    (_today + 7).end_of_week(:sunday)
  end
  def get_users
    User.all
  end
end
