module TrainingApp
  class Course < ActiveRecord::Base

    has_and_belongs_to_many :instructors
    has_many :registrations
    has_many :sections
    has_many :chapters, through: :sections
    belongs_to :venue

    has_many :child_courses, class_name: 'TrainingApp::Course', foreign_key: :parent_course_id
    belongs_to :parent_course, class_name: 'TrainingApp::Course'

    validate :start_date, :uniqueness => { :scope => :venue_id },
        :message => "One course at a time per venue, please."

    delegate :price, :title, :description_main, :synopsis, to: :parent_course, prefix: true, allow_nil: true
    delegate :name, :city, :address, to: :venue, prefix: true, allow_nil: true

    def price
      price = read_attribute(:price)
      price.present? ? price : parent_course_price
    end

    def title
      title = read_attribute(:title)
      title.present? ? title : parent_course_title
    end

    def description_main
      desc = read_attribute(:description_main)
      desc.present? ? desc : parent_course_description_main
    end

    def synopsis
      synopsis = read_attribute(:synopsis)
      synopsis.present? ? synopsis : parent_course_synopsis
    end

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

    def dates
      if start_date.month == end_date.month
        "#{start_date.strftime('%B %e')} - #{end_date.strftime('%e, %Y')}"
      else
        "#{start_date.strftime('%B %e')} - #{end_date.strftime('%B %e, %Y')}"
      end
    end

    def sibling_courses
      parent_course.present? ? parent_course.child_courses : []
    end

    def to_s
      title
    end

    def meta
      return "Online" if online?
      "#{start_date.strftime("%B %d, %Y") if start_date.present?} - #{venue_city}"
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

    def self.top_level
      where(parent_course_id: nil)
    end
  end
end

