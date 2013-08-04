require "spec_helper"

module TrainingApp
  describe Confirmation do

    before do
      TrainingApp::Registration.any_instance.stub(:charge_stripe).and_return(true)
    end

    Given(:registration) { FactoryGirl.create(:registration, workshop: nil) }
    When(:registration_mail) { TrainingApp::Confirmation.registered(registration) }
    Then { registration_mail.body.should =~ /great day/i }
    Then { registration_mail.body.should =~ /#{registration.code}/ }
  end
end

