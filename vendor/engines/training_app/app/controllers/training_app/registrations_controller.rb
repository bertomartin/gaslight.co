module TrainingApp
  class RegistrationsController < ApplicationController

    respond_to :json, :html

    expose(:course)
    expose(:registration, finder: :find_by_code)

    def stats
      regs = Registration.where('created_at > ?', Date.new(2013, 5, 31))
      render json: { quantity: regs.size }
    end
  end
end

