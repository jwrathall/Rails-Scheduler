class Calendar
  require 'date'
  require 'time'
  attr_accessor  :year, :month, :day, :_today
                                 #make a change

  def initialize(attributes = {}, options = {})
    @day, @month, @year = attributes[:day], attributes[:month], attributes[:year]
    @month_days = get_days_in_months(@year, @month)
    self._today = Date.new(@year,@month,@day)
  end
  def days_in_month
    @month_days
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
end