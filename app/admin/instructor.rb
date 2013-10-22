ActiveAdmin.register TrainingApp::Instructor do
  menu label: 'Instructors', parent: 'Training'

  controller do
    def permitted_params
      params.permit(training_app_instructor: [:name, :image_url, :bio])
    end
  end
end
