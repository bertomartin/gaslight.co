require "spec_helper"

module TrainingApp
  describe Confirmation do

    before do
      TrainingApp::Registration.any_instance.stub(:charge_stripe).and_return(true)
    end

    Given(:registration) { FactoryGirl.create(:registration) }
    When(:registration_mail) { TrainingApp::Confirmation.registered(registration) }
    Then { expect(registration_mail.body).to match registration.course.title }
    Then { expect(registration_mail.body).to match "code=#{registration.code}#/courses/#{registration.course.id}" }
  end
end

