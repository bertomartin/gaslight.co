module TrainingApp
  class RegistrationsController < ApplicationController
    respond_to :json, :html

    def new
      @course = Course.find(params[:course_id])
      @registration = @course.registrations.build(amount: @course.price)
    end

    def create
      @course = Course.find(params[:course_id])
      @registration = Registration.new(registration_params)
      @registration.purchase!
      respond_with @course, @registration
    end

    def stats
      regs = Registration.where('created_at > ?', Date.new(2013, 5, 31))
      render json: { quantity: regs.size }
    end

    private

    def registration_params
      params.require(:registration).permit!
    end
  end
end

