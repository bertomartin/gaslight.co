module TrainingApp
  class CoursesController < ApplicationController

    respond_to :html

    expose(:courses) { Course.active.top_level }
    expose(:featured_courses) { Course.active.featured }
    expose(:course)
  end
end

