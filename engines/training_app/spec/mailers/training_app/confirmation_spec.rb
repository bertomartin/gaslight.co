require "spec_helper"

module TrainingApp
  describe Confirmation do

    before do
      TrainingApp::Registration.any_instance.stub(:charge_stripe).and_return(true)
    end

    Given(:registration) { FactoryGirl.create(:registration) }
    When(:registration_mail) { TrainingApp::Confirmation.registered(registration) }
    Then { expect(registration_mail.body).to match "great day" }
    Then { expect(registration_mail.body).to match "/courses/#{registration.course.id}/registrations/#{registration.code}" }
  end
end

