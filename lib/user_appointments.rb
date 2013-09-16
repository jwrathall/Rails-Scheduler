class UserAppointments

  attr_accessor :user, :hours

  def initialize(user, business_hours)
      self.user = user
      self.hours= business_hours
  end
end