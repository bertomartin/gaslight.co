require "spec_helper"

describe Confirmation do

  before do
    Registration.any_instance.stub(:charge_stripe).and_return(true)
  end

  Given(:registration) { FactoryGirl.create(:registration, workshop: nil) }
  When(:registration_mail) { Confirmation.registered(registration) }
  Then { registration_mail.body.should =~ /great day/i }
  Then { registration_mail.body.should =~ /#{registration.code}/ }
end
