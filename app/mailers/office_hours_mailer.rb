class OfficeHoursMailer < ActionMailer::Base
  default from: "office_hours@gaslight.co"
  default to: "office_hours@gaslight.co"

  def request_email(message)
  	@message = message
  	mail(subject: "Request for Office Hours from #{message.name}")
  end
end
