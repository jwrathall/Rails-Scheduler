class BusinessHours
     require 'Time'
     require 'Date'
  #https://gist.github.com/ryanb/456307

  attr_accessor :open, :close

  def initialize(opening, closing)
    #@schedule = { :default => [opening, closing] }
    @close = Time.new(2012, 1, 1, closing.to_i, 0, 0)
    @open = Time.new(2012, 1, 1, opening.to_i, 0, 0)
  end
  def open_integer
    @open.to_i
  end
  def close_integer
    @close.to_i
  end
end