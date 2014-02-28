class AppointmentsController < ApplicationController

  def index
    @appointment = Appointment.new
    @appointments_by_date = Appointment.group_by_date
    @date = Date.today
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def edit
    @appointment = Appointment.find(params[:id])
    render partial: "edit", locals: { appointment: @appointment }
  end

  def create
    @appointment = Appointment.new(params[:appointment])
    if @appointment.save
      @appointments_by_date = Appointment.group_by_date
      render partial: 'list', notice: 'Appointment was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params[:appointment])
      render partial: 'show', locals: { appointment: @appointment },
       notice: 'Appointment was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    render partial: "delete_confirmation"
  end
end
