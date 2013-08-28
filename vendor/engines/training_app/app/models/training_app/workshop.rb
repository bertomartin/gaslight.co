module TrainingApp
  class Workshop < ActiveRecord::Base
    belongs_to :course
    has_many :registrations
    belongs_to :venue

    def self.upcoming
      where('training_app_workshops.start_date >= ?', Date.today)
    end

    def self.past
      where('training_app_workshops.start_date <= ?', Date.today)
    end

    def self.current
      upcoming.first
    end

    def self.other_than(workshop)
      return scoped if workshop.nil?
      where("id != ?", workshop.id)
    end
    
    def self.by_slug(id)
      where(id: id.split('-').first).first
    end

    delegate :title, to: :course, allow_nil: true, prefix: :course

    def to_s
      course.title
    end

    def to_param
      city  = venue.city.gsub(/ /,'-').downcase unless venue.nil?
      title = course.title.gsub(/ /,'-').downcase unless course.nil?
      date  = start_date.strftime('%Y-%B').downcase unless start_date.nil?
      [id, date, city, title].reject(&:nil?).join('-')
    end

    def location
      city || ""
    end

    def city
      (venue && venue.city) && venue.city.split(',').first || ""
    end

    def full?
      registrations.count.to_i >= capacity.to_i
    end

    def dates
      if start_date.month == end_date.month
        "#{start_date.strftime('%B %e')} - #{end_date.strftime('%e, %Y')}"
      else
        "#{start_date.strftime('%B %e')} - #{end_date.strftime('%B %e, %Y')}"
      end
    end

    def current_price
      if early_bird_price && early_bird_end_date && Time.now <= early_bird_end_date
        early_bird_price
      else
        price
      end
    end
  end
end

