class Admin::UserController < ApplicationController
  layout 'admin'
# GET /admin/users
# GET /admin/users.json
  def index
    show
    render('show')
  end

  def show
    @user = User.all
  end

  # GET /admin/users/new
  # GET /admin/users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /admin/users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User saved"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(:action => 'show')
    else
      render('edit')
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end
end

