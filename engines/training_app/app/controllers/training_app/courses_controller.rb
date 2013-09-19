module TrainingApp
  class CoursesController < ApplicationController

    respond_to :json, :html

    expose(:courses)
    expose(:featured_courses) { Course.featured }
    expose(:course)
  end
end

