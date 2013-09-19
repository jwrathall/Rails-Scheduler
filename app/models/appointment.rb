class Appointment < ActiveRecord::Base
  require 'date'
  require 'time'

  belongs_to :user
  attr_accessible :date, :end_time, :is_all_day, :start_time, :user_id,:closing, :opening
  attr_accessor :closing, :opening

  #write method to return array of arrays for user/appointment

  ##try using a scope
  scope :today, lambda{|date| where('date = ?', date)}
end
