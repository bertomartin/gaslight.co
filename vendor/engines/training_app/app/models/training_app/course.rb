module TrainingApp
  class Course < ActiveRecord::Base

    has_and_belongs_to_many :instructors
    has_many :registrations
    has_many :workshops
    belongs_to :venue

    validate :start_date, :uniqueness => { :scope => :venue_id },
        :message => "One course at a time per venue, please."

    def self.featured
      where(featured: true).limit(2)
    end

    def in_person?
      (start_date.present? || workshops.present?) ? true : false
    end
  end
end

