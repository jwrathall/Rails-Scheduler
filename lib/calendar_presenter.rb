class CalendarPresenter
  attr_accessor  :users, :calendar, :today

  def initialize(attributes = {})
    @users = attributes[:users]
    @calendar = attributes[:calendar_machine]
  end
end

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