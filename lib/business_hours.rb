class BusinessHours
     require 'Time'
     require 'Date'
  #https://gist.github.com/ryanb/456307

  attr_accessor :opening, :closing

  def initialize(opening, closing)
    #@schedule = { :default => [opening, closing] }
    self.closing = Time.new(2012, 1, 1, closing.to_i, 0, 0)
    self.opening = Time.new(2012, 1, 1, opening.to_i, 0, 0)
  end
  def store_open
    self.opening.to_time.strftime('%H')
  end
  def store_close
    self.closing.to_time.strftime('%H')
  end
end