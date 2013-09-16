module TrainingApp
  class Course < ActiveRecord::Base

    has_and_belongs_to_many :instructors
    has_many :registrations
    has_many :workshops

    validate :start_date, :uniqueness => { :scope => :venue_id },
        :message => "One course at a time per venue, please."

  end
end

