module TrainingApp
  class ClassroomController < ApplicationController
    layout "training_app/layouts/classroom"
    respond_to :html
    expose(:registration, finder: :find_by_code, finder_parameter: :code)
  end
end

