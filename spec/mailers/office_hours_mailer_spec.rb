require "spec_helper"

describe OfficeHoursMailer do
	include ERB::Util

  let(:message) do OfficeHoursMessage.new(
  	
  		name: "John Doe",
  		email: "john.doe@example.com",
  		company: "John Deer Trackers",
  		date: "11/01/2013",
  		timeslot: "9:00 - 10:00AM",
  		description: <<-EOR
  		I really need help with this new project. I think it would best
  		be served with a customer word press plugin, but I'm not sure.
  		EOR
  	)
  end
  let(:mail) { OfficeHoursMailer.request_email(message) }

  it 'sets the from' do
    mail.from.should include('office_hours@gaslight.co')
  end

  it 'sets the to' do
  	mail.to.should include("office_hours@gaslight.co")
  end

  it 'sets the subject' do
    mail.subject.should match("Request for Office Hours")
  end

  it 'puts the full name in the subject' do
  	mail.subject.should match(message.name)
  end

  it 'sets the email' do
  	%w(name email company description date timeslot).each do |attribute|
    	mail.body.should match(html_escape message.send(attribute))
    end
  end
end