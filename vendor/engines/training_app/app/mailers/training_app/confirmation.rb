module TrainingApp
  class Confirmation < ActionMailer::Base
    default from: "Gaslight <training@gaslight.co>"

    def registered(registration)
      @registration = registration
      mail(to: registration.email, subject: "[Gaslight] Thank you for your purchase!")
    end
  end
end

