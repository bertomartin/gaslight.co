module TrainingApp
  module Api
    class SectionsController < ApplicationController
      respond_to :json

      def index
        registration = Registration.find_by(code: params["code"]) || raise_not_found
        respond_with(registration.course.sections)
      end
    end
  end
end