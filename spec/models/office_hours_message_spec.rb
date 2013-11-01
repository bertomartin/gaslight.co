require 'spec_helper'

describe OfficeHoursMessage do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:description) }

  describe ".new" do
    let(:message) { OfficeHoursMessage.new(
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
    }
    it "is valid with normal attributes" do
      %w(name email company date timeslot description).each do |attribute|
        message.send(attribute).should_not be_empty
      end
    end
  end
end
