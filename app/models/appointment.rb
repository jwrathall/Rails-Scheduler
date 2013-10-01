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
  def appointment_conflict(user_id)
    user_id = user_id
    #check to see if appointments ends
  end
  end
  def self.latest_error_code(module_id, min, max)
    where(
        'error_module_id = :module_id and code between :min and :max',
        :module_id => module_id, :min => min, :max => max
    )
end
