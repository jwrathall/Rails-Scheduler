class BusinessHours
     #require 'Time'
     require 'Date'
  #https://gist.github.com/ryanb/456307

  attr_accessor :opening, :closing

  def initialize(opening, closing)
    #errors cause we are passing strings and not integers
    self.closing = DateTime.new('2012, 8, 29, 22, 35, 0')
    self.opening = DateTime.new('2012, 8, 29, 22, 35, 0')
    #@schedule = { :default => [opening, closing] }
  end
end