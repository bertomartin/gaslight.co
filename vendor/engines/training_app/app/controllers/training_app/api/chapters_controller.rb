module TrainingApp
  module Api
    class ChaptersController < ApplicationController
      respond_to :json

      def index
        respond_with(Chapter.all)
      end
    end
  end
end