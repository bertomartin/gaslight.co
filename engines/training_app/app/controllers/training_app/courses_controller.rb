module TrainingApp
  class CoursesController < ApplicationController

    respond_to :html

    expose(:courses) { Course.active.top_level }
    expose(:course)
  end
end

