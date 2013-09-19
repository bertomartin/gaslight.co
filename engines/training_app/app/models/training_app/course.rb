module TrainingApp
  class Course < ActiveRecord::Base

    has_and_belongs_to_many :instructors
    has_many :registrations
    has_many :workshops
    has_many :sections
    has_many :chapters, through: :sections
    belongs_to :venue

    has_many :child_courses, class_name: 'TrainingApp::Course', foreign_key: :parent_course_id
    belongs_to :parent_course, class_name: 'TrainingApp::Course'

    validate :start_date, :uniqueness => { :scope => :venue_id },
        :message => "One course at a time per venue, please."

    def in_person?
      !online?
    end

    def current_price
      if early_bird_price && early_bird_end_date && Time.now <= early_bird_end_date
        early_bird_price
      else
        price
      end
    end

    def full?
      registrations.count >= capacity
    end

    def city
      (venue && venue.city) && venue.city.split(',').first || ""
    end

    def dates
      if start_date.month == end_date.month
        "#{start_date.strftime('%B %e')} - #{end_date.strftime('%e, %Y')}"
      else
        "#{start_date.strftime('%B %e')} - #{end_date.strftime('%B %e, %Y')}"
      end
    end

    def to_s
      title
    end

    def self.current
      upcoming.first
    end

    def self.featured
      where(featured: true).limit(2)
    end

    def self.by_slug(id)
      where(id: id.split('-').first).first
    end

    def self.upcoming
      where('start_date >= ?', Date.today)
    end

    def self.past
      where('start_date <= ?', Date.today)
    end
  end
end

