class OfficeHoursMessage < Message

	attr_accessor :description, :company, :date, :timeslot

  validates :description, presence: true

  def process
    valid? ? OfficeHoursMailer.request_email(self).deliver : false
  end
end