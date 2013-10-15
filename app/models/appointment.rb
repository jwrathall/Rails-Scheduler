class Appointment < ActiveRecord::Base
  require 'date'
  require 'time'

  belongs_to :user
  attr_accessible :date, :end_time, :is_all_day, :start_time, :user_id,:closing, :opening
  attr_accessor :closing, :opening, :cell_width, :duration

  scope :today, lambda{|date| where('date = ?', date).order(:start_time)}

  scope :user_name, lambda { |id|
    joins(:user).where('users.id = ?', id)
  }

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

  def collision
    _end_time = self.end_time.-1.minute
    count = Appointment.where(["user_id = ? AND start_time BETWEEN ? AND ?",self.user_id, self.start_time.strftime('%H:%M').to_s, _end_time.strftime('%H:%M').to_s]).select("COUNT(*) AS total")
    if (count.first.total > 0)
      return true
    else
      return false
    end
  end
  def get_username
    #me thinks this one smells a bit, its another hit to the db
   @user = User.find(self.user_id)
   @user.full_name
  end
end
