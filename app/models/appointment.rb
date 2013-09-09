class Appointment < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :end_time, :is_all_day, :start_time, :user_id
  #write method to return array of arrays for user/appointment
end
