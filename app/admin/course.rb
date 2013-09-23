ActiveAdmin.register TrainingApp::Course do
  menu label: 'Courses', parent: 'Training'

  index do
    column :title
    column :parent_course
    column :start_date
    column :end_date
    column :price
    column :featured
    column :online

    default_actions
  end
end
