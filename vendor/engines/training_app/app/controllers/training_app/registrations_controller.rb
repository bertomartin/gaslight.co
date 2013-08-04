module TrainingApp
  class RegistrationsController < InheritedResources::Base

    respond_to :json, :html

    def show
      @registration = Registration.find_by_code(params[:id])

      if @registration.nil?
        redirect_to registrations_path and return
      end

      render :index
    end

    def stats
      regs = Registration.where('created_at > ?', Date.new(2013, 5, 31))
      render json: { quantity: regs.size }
    end
  end
end

