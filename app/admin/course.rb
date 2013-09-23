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

  form do |f|
    f.inputs "Course Details" do
      f.input :venue
      f.input :parent_course, collection: TrainingApp::Course.top_level
      f.input :description_main
      f.input :synopsis
      f.input :start_date
      f.input :end_date
      f.input :price
      f.input :image_url
      f.input :registration_link
      f.input :online
      f.input :featured
    end
    f.actions
  end
end
