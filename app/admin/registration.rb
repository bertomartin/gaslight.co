ActiveAdmin.register TrainingApp::Registration do
  menu label: 'Registrations', parent: 'Training'

  controller do
    def permitted_params
      params.permit!
    end
  end
end

