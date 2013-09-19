class User < ActiveRecord::Base
  require 'bcrypt'

  has_many :appointments

  attr_accessible :email, :first_name, :last_name, :password, :user_name
  attr_accessor :password, :today

  before_save :encrypt_password

  #http://blog.donwilson.net/2011/11/constructing-a-less-than-simple-query-with-rails-and-arel/

  def self.appointments_today(t)
    joins(:appointments).where('appointments.date' => t.to_s).first
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(username, password)
    user = find_by_user_name(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
      user
    else
      nil
    end

  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end
  def get_appointments_for_today
    @appointments = self.appointments.where(:date => self.today)
  end
end
