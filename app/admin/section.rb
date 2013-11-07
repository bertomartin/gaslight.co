ActiveAdmin.register TrainingApp::Section do
  menu label: 'Sections', parent: 'Training'

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :id
    column :course
    column :title
    column :sort_order
    default_actions
  end

  form do |f|
    f.inputs "Section Details" do
      f.input :course, collection: TrainingApp::Course.online
      f.input :title
      f.input :sort_order
    end
    f.actions
  end
end
