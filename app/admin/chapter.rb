ActiveAdmin.register TrainingApp::Chapter do
  menu label: 'Chapters', parent: 'Training'

  controller do
    def permitted_params
      params.permit!
    end
  end
end
