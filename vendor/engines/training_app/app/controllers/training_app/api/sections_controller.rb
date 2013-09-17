module TrainingApp
  module Api
    class SectionsController < ApplicationController
      respond_to :json

      def index
        respond_with(Section.all)
      end
    end
  end
end