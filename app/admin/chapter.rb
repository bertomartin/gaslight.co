ActiveAdmin.register TrainingApp::Chapter do
  menu label: 'Chapters', parent: 'Training'

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Chapter Details" do
      f.input :title
      f.input :section, collection: Hash[TrainingApp::Section.all.map {|s| ["#{s.course.title} - #{s.title}", s.id] }]
      f.input :description, as: :text
      f.input :video_url
      f.input :code_url
      f.input :poster_url
      f.input :duration, placeholder: "In seconds"
      f.input :sort_order
      f.input :demo
    end
    f.actions
  end
end
