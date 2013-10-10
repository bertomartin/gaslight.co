ActiveAdmin.register TrainingApp::Course do
  menu label: 'Courses', parent: 'Training'

  controller do
    def permitted_params
      params.permit(training_app_course: [:venue_id, :parent_course_id, :title,
                                          :description_main, :synopsis,
                                          :start_date, :end_date, :price,
                                          :image_url, :registration_link,
                                          :color_primary, :color_secondary,
                                          :active, :online, :featured,
                                          :instructors])
    end
  end

  index do
    column :title
    column :parent_course
    column :start_date
    column :end_date
    column :price
    column :active
    column :featured
    column :online

    default_actions
  end

  show do |course|
    attributes_table do
      row :id
      row :title
      row(:description_main) { pre course.description_main }
      row(:description_html) { raw Renderer.render(course.description_main) }
      row :synopsis
      row :start_date
      row :end_date
      row :price
      row :venue
      row(:image) { image_tag(course.image_url) }
      row :featured
      row :capacity
      row :early_bird_price
      row :early_bird_end_date
      row :registration_link
      row :parent_course
      row :online
      row :color_primary
      row :color_secondary
      row :active
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Course Details" do
      f.input :venue
      f.input :parent_course, collection: TrainingApp::Course.top_level
      f.input :title
      f.input :description_main
      f.input :synopsis
      f.input :start_date
      f.input :end_date
      f.input :price
      f.input :image_url
      f.input :registration_link
      f.input :color_primary
      f.input :color_secondary
      f.input :active
      f.input :online
      f.input :featured
      f.input :instructors, as: :check_boxes
    end
    f.actions
  end
end
