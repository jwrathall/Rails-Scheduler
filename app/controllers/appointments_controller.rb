class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    @presenter = AppointmentPresenter.new({
                      :users => User.all,
                      :business_hours => BusinessHours.new(Settings.open_time, Settings.close_time),
                      :current_date => Date.parse('2013-09-18')
                      #:current_date => Date.parse(params['date'])
                      })
  end

  def show
    @appointment = Appointment.find_all_by_date(params[:date])
    redirect_to action: 'index'
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new(
        :user_id => params[:user_id],
        :start_time => Time.parse(params[:start_time]),
        :end_time => Time.parse(params[:start_time])+1.hour,
        :date => params[:date]
    )
    respond_to do |format|
      format.html {render action: 'new'}
      format.json { render json: @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if !@appointment.collision
        if @appointment.save
          format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        else
          format.html { render action: 'new'}
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to action: 'new',
                                  user_id: @appointment.user_id,
                                  start_time:@appointment.start_time,
                                  date: @appointment.date,
                                  notice: 'Another appointment exists during that time'
                    }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
end
