ActiveAdmin.register TrainingApp::Section do
  menu label: 'Sections', parent: 'Training'

  controller do
    def permitted_params
      params.permit!
    end
  end
end
