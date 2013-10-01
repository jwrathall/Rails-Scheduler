class Appointment < ActiveRecord::Base
  require 'date'
  require 'time'

  belongs_to :user
  attr_accessible :date, :end_time, :is_all_day, :start_time, :user_id,:closing, :opening
  attr_accessor :closing, :opening, :cell_width, :duration

  scope :today, lambda{|date| where('date = ?', date).order(:start_time)}

  def duration
    ((self.end_time - self.start_time) /60).round
  end
  def cell_width
    case self.duration
      when 60
        124
      when 45
        93
      when 30
        62
      when 15
        31
    end
  end
  def self.collision(user_id)
    count = Appointment.where(["user_id = ? AND start_time BETWEEN ? AND ?",user_id,'12:15','13:00']).select("COUNT(*) AS total")
    count.first.total
  end
end
