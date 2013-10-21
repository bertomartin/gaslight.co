module TrainingApp
  class CoursesController < ApplicationController

    respond_to :html

    expose(:online_courses) { Course.active.online }
    expose(:in_person_courses) { Course.active.in_person }
    expose(:course)
  end
end

