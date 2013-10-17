class CalendarPresenter
  attr_accessor  :users, :calendar, :today

  def initialize(attributes = {})
    @users = attributes[:users]
    @calendar = attributes[:calendar_machine]
  end

  def calendar_hash
    my_hash = Hash.new { |hash, key| hash[key] = Array.new }
    appointments = Appointment.where("date between ? and ?",Date.parse("2013-09-01"),Date.parse("2013-09-30")).order("date, user_id ASC")
    i =1
    while i <= @calendar.days_in_month
      appointments.each do |appointment|
        if i == appointment.date.strftime("%d").to_i
          my_hash["#{i}"] << appointment
        else
         # my_hash["#{i}"]  Array.new
        end
      end
      i += 1
    end
    @hash = my_hash

    #http://stackoverflow.com/questions/12872477/ruby-how-to-add-to-new-hash-of-array
    #http://stackoverflow.com/questions/5235216/ruby-adding-items-to-store-hash-and-shopping-cart-array
    #http://walrus-on-rails.blogspot.de/2012/12/hashes-and-arrays-in-rails-and.html
  end
end

#create array based on the length of the month
#foreach index of the array add a hash
#find possible appointments for that day(index)
#http://www.lesismore.co.za/hasharrays.html

#run a loop here based on the calendar to build out an array of days (1-31max),
#each element(day) would have an array of appointments
#class Shop
#  has_many :employees
#end
#
#class Employee
#  belongs_to :shop
#end
#Retrieve the employees for the given collection of shops in your controller:
#
#    @employees = Employee.all_by_shop_id(@shops, :order => :name)