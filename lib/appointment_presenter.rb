class AppointmentPresenter

  attr_accessor  :users, :store, :today

  def initialize(attributes = {})
    @users = attributes[:users]
    @store = attributes[:business_hours]
    @today = attributes[:current_date]
  end
end