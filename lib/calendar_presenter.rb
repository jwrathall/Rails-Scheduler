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
        # my_hash["#{i}"] << Array.new
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

#<%@presenter.calendar_hash.each do |key, value|
#    appointments = value.map{ |a| a }%>
#    <div style="width:50px;height:150px; border-right:solid 1px green;float:left;"><%= key%>
#      <%if value.any?%>
#          <div style="width:100%;">
#            <%row_flag = 1%>
#            <%appointments.each_with_index do |appointment, index|%>
#                <%if row_flag == 1%>
#                 <div style="width:100%;height:29px;margin:0 0 4px 0;clear:both;">
#                <%end%>
#                  <div style="width:12px; float:left; border:solid 1px red;margin:0 4px 0 0;">
#                    x
#                  </div>
#                  <%if row_flag == 2
#                    row_flag = 0
#                  %>
#                    </div>
#                  <%end%>
#                  <%row_flag +=1%>
#            <%end%>
#            <%if row_flag == 2%>
#            </div>
#            <%end%>
#          </div>
#      <%else%>
#          <div></div>
#      <%end%>
#    </div>
#<%end%>
# <br/>