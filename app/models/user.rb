class User < ActiveRecord::Base
  has_many :appointments
  attr_accessible :email, :first_name, :last_name, :password, :user_name
  def full_name
    "#{first_name} #{last_name}"
  end
end
