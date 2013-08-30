module TrainingApp
  class CoursesController < ApplicationController

    respond_to :json, :html

    expose(:courses)
    expose(:course)
  end
end

