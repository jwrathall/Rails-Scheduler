class UserController < ApplicationController
  def new
    @new = User.new
    #http://rubysource.com/rails-userpassword-authentication-from-scratch-part-ii/
  end
  def create
  end


end
