class OfficeHoursController < ApplicationController
  def create
  	respond_to do |format|
      if message.process
        flash[:success] = "Ok, we've got it! You'll hear from us soon."
        @message = OfficeHoursMessage.new
        format.html { redirect_to office_hours_path }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end

  end

  protected

  def message
    @message ||= OfficeHoursMessage.new(params[:office_hours_message] || {})
    @message.remote_ip = request.remote_ip
    @message.user_agent = request.user_agent
    @message
  end
  helper_method :message

  def dates_for_select
  	next_friday = Date.today.end_of_week - 2
  	options = []
  	8.times do |i|
  		date = next_friday + i.weeks
  		options << [date.strftime("%a, %b %d"), ""]
  	end
  	options
  end
  helper_method :dates_for_select

  def timeslots_for_select
  	[
  		["9:00 - 10:00AM", ""],
  		["10:00 - 11:00AM", ""]
  	]
  end
  helper_method :timeslots_for_select
end
