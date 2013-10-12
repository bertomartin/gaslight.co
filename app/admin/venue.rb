ActiveAdmin.register TrainingApp::Venue do
  menu label: 'Venues', parent: 'Training'

  controller do
    def permitted_params
      params.permit(training_app_venue: [:name, :address, :blurb, :city])
    end
  end
end

