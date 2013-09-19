class UserAppointments

  attr_accessor :user, :hours, :current_date

  def initialize(user, business_hours, current_date)
      self.user = user
      self.hours= business_hours
      self.current_date = current_date
  end
  def appointments_today
    #self.user.appointments.where(:date => self.current_date)
    self.user.appointments.where(:date => '2013-09-09').order('date')
  end
end