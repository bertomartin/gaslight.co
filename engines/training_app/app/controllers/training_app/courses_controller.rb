module TrainingApp
  class CoursesController < ApplicationController

    respond_to :html

    expose(:online_courses) { Course.online.active }
    expose(:in_person_courses) { Course.in_person.active.upcoming }
    expose(:course)
  end
end

